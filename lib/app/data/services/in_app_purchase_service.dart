import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;

  bool available = false;
  List<ProductDetails> products = [];

  StreamSubscription<List<PurchaseDetails>>? _subscription;

  /// Subscription IDs
  final Set<String> _productIds = {'deal_publish_7d', 'deal_publish_14d', 'deal_publish_30d'};

  /// 🔥 INIT
  Future<void> init(Function() onUpdate) async {
    available = await _iap.isAvailable();

    if (!available) {
      print('Store not available');
      return;
    }

    /// Listen to purchase updates
    _subscription = _iap.purchaseStream.listen(
      (purchaseDetailsList) {
        for (final purchase in purchaseDetailsList) {
          _handlePurchase(purchase, onUpdate);
        }
      },
      onError: (error) {
        print('Purchase Stream Error: $error');
      },
    );

    await loadProducts(onUpdate);
  }

  /// 🔥 LOAD PRODUCTS
  Future<void> loadProducts(Function() onUpdate) async {
    final response = await _iap.queryProductDetails(_productIds);

    if (response.error != null) {
      print('Product Load Error: ${response.error}');
      return;
    }

    products = response.productDetails;

    if (products.isEmpty) {
      print('No products found. Check Play Console setup.');
    }

    onUpdate();
  }

  /// 🔥 BUY SUBSCRIPTION
  void buy(ProductDetails product) {
    final purchaseParam = PurchaseParam(productDetails: product);

    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  /// 🔥 HANDLE PURCHASE
  Future<void> _handlePurchase(PurchaseDetails purchase, Function() onUpdate) async {
    switch (purchase.status) {
      case PurchaseStatus.pending:
        print('Purchase pending...');
        break;

      case PurchaseStatus.purchased:
      case PurchaseStatus.restored:
        bool valid = await _verifyWithServer(purchase);

        if (valid) {
          _deliverProduct(purchase);
        } else {
          print('Invalid purchase detected');
        }

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
        break;

      case PurchaseStatus.error:
        print('Purchase Error: ${purchase.error}');
        break;

      case PurchaseStatus.canceled:
        print('User canceled purchase');
        break;
    }

    onUpdate();
  }

  /// 🔥 DELIVER PRODUCT (Grant access)
  void _deliverProduct(PurchaseDetails purchase) {
    switch (purchase.productID) {
      case 'deal_publish_7d':
        print('✅ 7 Days subscription activated');
        break;

      case 'deal_publish_14d':
        print('✅ 14 Days subscription activated');
        break;

      case 'deal_publish_30d':
        print('✅ 30 Days subscription activated');
        break;

      default:
        print('Unknown product: ${purchase.productID}');
    }
  }

  /// 🔐 SERVER VALIDATION (IMPORTANT)
  Future<bool> _verifyWithServer(PurchaseDetails purchase) async {
    /// 👉 TODO: Replace with real backend validation
    /// For now, always return true (NOT SAFE for production)
    return true;
  }

  /// 🔄 RESTORE PURCHASES
  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  /// 🧹 CLEANUP
  void dispose() {
    _subscription?.cancel();
  }
}
