import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/widgets/vendor_deals_filter.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/widgets/vendor_deals_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsPage extends GetView<VendorAccountController> {
  const VendorDealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Deals', showBack: false),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            children: [
              // Search & Add new deal
              VendorDealsHeader(),
              const SizedBox(height: 18),

              // Deal filter
              VendorDealsFilter(),

              Divider(),

              // Deals tile
            ],
          ),
        ),
      ),
    );
  }
}
