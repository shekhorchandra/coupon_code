import 'dart:async';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  // IDs must match exactly what you put in the consoles
  static const _productIds = {'deal_publish_7d', 'deal_publish_14d', 'deal_publish_30d'};

  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxBool isProcessing = false.obs;
  bool available = false;

  Future<void> init() async {
    available = await _iap.isAvailable();
    if (!available) return;

    // Unified stream for all platforms
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (error) => Get.snackbar("Error", error.toString()),
    );

    await loadProducts();
  }

  Future<void> loadProducts() async {
    final response = await _iap.queryProductDetails(_productIds);
    // Sort products by price or ID to keep UI consistent
    products.assignAll(response.productDetails);
  }

  void buy(ProductDetails product) {
    isProcessing.value = true;
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);

    _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (var purchase in purchases) {
      if (purchase.status == PurchaseStatus.pending) {
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        isProcessing.value = false;
        Get.snackbar("Error", "Transaction failed: ${purchase.error?.message}");
      }

      if (purchase.status == PurchaseStatus.canceled) {
        isProcessing.value = false;
        Get.snackbar("Error", "Transaction canceled!");
      }

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        // 🔥 VALIDATE WITH EXPRESS.JS
        bool valid = await _verifyWithExpress(purchase);

        if (valid) {
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          Get.snackbar("Success", "Plan activated successfully!");
        }
        isProcessing.value = false;
      }
    }
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  Future<bool> _verifyWithExpress(PurchaseDetails purchase) async {
    // Implement your http call to the backend here
    return true;
  }
}
