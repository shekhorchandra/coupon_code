import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOutletForm extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Business Address', style: AppText.body1.semiBold),
        const SizedBox(height: 5),
        CustomTextField(
          hint: 'e.g.: Shop Name, Street, City, Country',
          controller: controller.businessAddressController,
          icon: Icons.pin_drop_outlined,
        ),
        const SizedBox(height: 10),

        Text('Business Location', style: AppText.body1.semiBold),
        const SizedBox(height: 5),

        const SizedBox(height: 10),

        Text('Zip Code', style: AppText.body1.semiBold),
        const SizedBox(height: 5),
        CustomTextField(
          hint: 'Enter your zip code',
          controller: controller.zipCodeController,
          icon: Icons.numbers_rounded,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
