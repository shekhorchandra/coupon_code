import 'package:coupon_code/app/data/services/in_app_purchase_service.dart';
import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final InAppPurchaseService _purchaseManager = InAppPurchaseService();

  @override
  void initState() {
    super.initState();
    _purchaseManager.init(() {
      setState(() {}); // Update UI when purchase state changes
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_purchaseManager.available) {
      return Scaffold(
        appBar: AppBar(title: Text('Purchases')),
        body: Center(child: Text('Store not available')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Purchases')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _purchaseManager.restorePurchases(),
            child: Text('Restore Purchases'),
          ),

          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _purchaseManager.products.map((product) {
              return ListTile(
                title: Text(product.title),
                subtitle: Text(product.description),
                trailing: ElevatedButton(
                  child: Text(product.price),
                  onPressed: () => _purchaseManager.buy(product),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
