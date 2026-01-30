import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsHeader extends GetView<VendorDealsController> {
  const VendorDealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: CustomTextField(hint: 'Search your deals...', icon: Icons.search_rounded),
        ),
        const SizedBox(width: 10),

        // Add new deal button
        Expanded(
          child: AppButton(text: 'Add New Deal', onPressed: () {}, icon: Icons.add_rounded),
        ),
      ],
    );
  }
}
