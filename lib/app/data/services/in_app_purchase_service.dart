import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final DioClient _dioClient = DioClient();

  // Prevent duplicate verifications
  final Set<String> _verifyingPurchaseIds = {};

  // Map purchaseID → deal info
  final Map<String, _DealInfo> _purchaseInfoMap = {};

  static final _productIds = Platform.isAndroid
      ? {'quick_start_7d', 'standard_14d', 'extended_30d'}
      : {'deal_publish_7d', 'deal_publish_14d', 'deal_publish_30d'};

  List<ProductDetails> products = [];
  bool isAvailable = false;

  /// Callback to notify controller
  void Function(bool success)? purchaseCallback;

  Future<void> init() async {
    isAvailable = await _iap.isAvailable();
    if (!isAvailable) return;

    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (e) => log("Purchase stream error: $e"),
    );

    await loadProducts();
  }

  Future<void> loadProducts() async {
    final response = await _iap.queryProductDetails(_productIds);
    products = response.productDetails.toList()..sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    log("Loaded products: ${products.map((e) => e.id).toList()}");
  }

  /// Initiate purchase and store deal info
  void buy(ProductDetails product, String dealId) {
    final purchaseParam = PurchaseParam(productDetails: product);
    _iap.buyConsumable(purchaseParam: purchaseParam);

    // Store deal info by productId temporarily
    _purchaseInfoMap[product.id] = _DealInfo(
      dealId: dealId,
      currency: product.currencyCode,
      price: product.rawPrice,
    );
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (var purchase in purchases) {
      final pId = purchase.purchaseID;
      if (pId == null || _verifyingPurchaseIds.contains(pId)) continue;

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        _verifyingPurchaseIds.add(pId);

        // Get deal info from productId map
        final info = _purchaseInfoMap[purchase.productID];
        if (info == null) {
          log("No deal info for product ${purchase.productID}");
          continue;
        }

        log("Verifying purchase $pId for deal ${info.dealId}");

        final success = await _verifyWithServer(purchase, info);

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
          log("Completed purchase $pId");
        }

        _verifyingPurchaseIds.remove(pId);
        _purchaseInfoMap.remove(purchase.productID);

        // Notify controller
        if (purchaseCallback != null) purchaseCallback!(success);
      } else if (purchase.status == PurchaseStatus.error ||
          purchase.status == PurchaseStatus.canceled) {
        if (purchase.pendingCompletePurchase) await _iap.completePurchase(purchase);
        if (purchaseCallback != null) purchaseCallback!(false);
      }
    }
  }

  Future<bool> _verifyWithServer(PurchaseDetails purchase, _DealInfo info) async {
    try {
      final purchaseData = {
        "dealId": info.dealId,
        "currency": info.currency,
        "price": info.price,
        "productId": purchase.productID,
        "purchaseId": purchase.purchaseID ?? '',
        "localVerificationData": purchase.verificationData.localVerificationData,
        "serverVerificationData": purchase.verificationData.serverVerificationData,
        "source": purchase.verificationData.source,
      };

      final url = Platform.isAndroid
          ? ApiConstants.verifyPurchaseGoogle
          : ApiConstants.verifyPurchaseApple;

      final response = await _dioClient.client.post(url, data: purchaseData);
      log("Server verification status: ${response.statusCode}");
      return response.statusCode == 200;
    } catch (e) {
      log("Verification error: $e");
      return false;
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}

class _DealInfo {
  final String dealId;
  final String currency;
  final double price;

  _DealInfo({required this.dealId, required this.currency, required this.price});
}
