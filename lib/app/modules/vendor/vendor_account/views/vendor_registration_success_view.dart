import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VendorRegistrationSuccessView extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                SvgPicture.asset(AppAssets.hourglassLoading),
                Image.asset(AppAssets.hourglassLoading),

                const SizedBox(height: 25),

                Text(
                  'We are reviewing your application. We usually review within 24-48 hours. Thank you for your patience',
                  textAlign: .center,
                  style: AppText.label.regular.copyWith(color: AppColor.greyText),
                ),

                const SizedBox(height: 30),

                AppButton(
                  text: 'Go to Dashboard',
                  onPressed: () => Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
