import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final DioClient _dioClient = DioClient();

  static final _productIds = Platform.isAndroid
      ? const {'quick_start_7d', 'standard_14d', 'extended_30d'}
      : const {'deal_publish_7d', 'deal_publish_14d', 'deal_publish_30d'};

  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxBool isProcessing = false.obs;
  bool available = false;
  RxString dealId = ''.obs;
  RxString currency = ''.obs;
  Rx<double> price = (0.0).obs;

  // Prevent multiple simultaneous initializations
  Completer<void>? _initCompleter;

  Future<void> init() async {
    if (_initCompleter != null) return _initCompleter!.future;
    _initCompleter = Completer<void>();

    try {
      available = await _iap.isAvailable();
      if (!available) {
        _initCompleter!.complete();
        return;
      }

      _subscription?.cancel(); // Cancel existing if any
      _subscription = _iap.purchaseStream.listen(
        _onPurchaseUpdate,
        onError: (error) {
          isProcessing.value = false;
          Get.snackbar("Error", error.toString());
        },
      );

      await loadProducts();
      _initCompleter!.complete();
    } catch (e) {
      _initCompleter!.completeError(e);
      _initCompleter = null; // Allow retry on error
    }
  }

  Future<void> loadProducts() async {
    final response = await _iap.queryProductDetails(_productIds);
    // Sort logic moved here to keep UI logic clean
    final list = response.productDetails.toList();
    list.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    products.assignAll(list);
  }

  void buy(ProductDetails product, String id) {
    if (isProcessing.value) return; // Prevent double trigger

    isProcessing.value = true;
    dealId.value = id;

    currency.value = product.currencyCode;
    price.value = product.rawPrice;

    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (var purchase in purchases) {
      if (purchase.status == PurchaseStatus.pending) {
        isProcessing.value = true;
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        isProcessing.value = false;
        Get.snackbar("Error", "Transaction failed: ${purchase.error?.message}");

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.canceled) {
        isProcessing.value = false;

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        bool valid = await _verifyWithServer(purchase, dealId.value);

        if (valid) {
          Get.offAllNamed(AppRoutes.DEAL_PLAN_PURCHASE_SUCCESS);
        } else {
          Get.snackbar('Error', 'Couldn\'t verify your purchase!');
        }

        // ✅ ALWAYS complete
        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }

        isProcessing.value = false;
      }
    }
  }

  Future<bool> _verifyWithServer(PurchaseDetails purchase, String dealId) async {
    try {
      final Map<String, dynamic> purchaseData = {
        "dealId": dealId,
        "currency": currency.value,
        "price": price.value,
        "status": purchase.status.name,
        "productId": purchase.productID,
        "purchaseId": purchase.purchaseID ?? '',
        "localVerificationData": purchase.verificationData.localVerificationData,
        "serverVerificationData": purchase.verificationData.serverVerificationData,
        "source": purchase.verificationData.source,
      };

      if (Platform.isAndroid) {
        final response = await _dioClient.client.post(
          ApiConstants.verifyPurchaseGoogle,
          data: purchaseData,
        );
        return response.statusCode == 200;
      } else if (Platform.isIOS) {
        final response = await _dioClient.client.post(
          ApiConstants.verifyPurchaseApple,
          data: purchaseData,
        );
        return response.statusCode == 200;
      } else {
        return false;
      }
    } catch (e) {
      log("Verification Error: $e");
      return false;
    }
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  void dispose() {
    _subscription?.cancel();
  }
}
