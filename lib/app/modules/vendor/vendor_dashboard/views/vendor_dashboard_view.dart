import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/create_vendor_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateVendorAccountPage extends GetView<VendorNavigationBarController> {
  const CreateVendorAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Create Your Vendor Account', showBack: false),

      body: SafeArea(child: Text('CreateVendorAccountController')),
    );
  }
}
