import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealPublishNoticeView extends GetView<VendorDealsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Icon(Icons.warning_rounded, color: AppColor.warning, size: Get.width * 0.5),
            Text('Official Promotion Notice', style: AppText.body1.semiBold),

            const SizedBox(height: 25),

            Text(
              'This content has been published by an authorized representative of the business and is intended solely for official promotional, advertising, and informational purposes. Any postings, offers, or representations that are not expressly approved by the business are unauthorized and strictly prohibited. Unauthorized use, misrepresentation, reproduction, or distribution of the business\’s name, branding, or promotional materials may result in legal action, including financial penalties and/or criminal prosecution, as permitted by applicable law. All rights are reserved and protected under applicable local, state, and federal regulations',
              textAlign: .justify,
            ),

            const SizedBox(height: 20),

            // T&C
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: controller.acceptedTnC.value,
                    onChanged: (status) => controller.acceptedTnC.value = status ?? false,
                  ),

                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I acknowledge and agree to the ',
                            style: AppText.body2.regular.copyWith(color: AppColor.bw.s800),
                          ),

                          TextSpan(
                            text: 'Terms and Conditions.',
                            style: AppText.body2.regular.copyWith(color: AppColor.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.TERMSCONDITION);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            AppButton(text: 'Agree & Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
