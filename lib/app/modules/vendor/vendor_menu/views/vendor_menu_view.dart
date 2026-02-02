import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorMenuPage extends GetView<VendorAccountController> {
  const VendorMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Menu', showBack: false),

      body: SafeArea(
        child: Column(
          children: [
            Text('CreateVendorAccountController'),

            AppButton(text: 'Logout', onPressed: () => Get.toNamed(AppRoutes.PAYMENT_METHOD)),
          ],
        ),
      ),
    );
  }
}
