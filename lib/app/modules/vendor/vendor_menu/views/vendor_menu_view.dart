import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/create_vendor_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorMenuPage extends GetView<VendorNavigationBarController> {
  const VendorMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Create Your Vendor Account', showBack: false),

      body: SafeArea(child: Text('CreateVendorAccountController')),
    );
  }
}
