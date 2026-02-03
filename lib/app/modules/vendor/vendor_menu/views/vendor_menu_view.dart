import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorMenuPage extends GetView<VendorAccountController> {
  const VendorMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Menu', showBack: false),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            children: [
              // User Info
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Glamour Glow Salon', style: AppText.h5.semiBold),
                        Text('glamourglow123@gmail.com', style: AppText.body2.medium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
