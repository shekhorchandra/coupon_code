import 'package:coupon_code/app/modules/auth/vendor/login/vendor_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../routes/app_routes.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';

class MenuController extends GetxController {
  final navController = Get.find<UserNavigationBarController>();

  // Profile/Login
  void onLoginTap() {
    final VendorLoginController _vendorLoginController = Get.isRegistered<VendorLoginController>()
        ? Get.find<VendorLoginController>()
        : Get.put(VendorLoginController());

    _vendorLoginController.isVerifiedOrIsShopCreated();
  }

  void goToAbout() {
    Get.toNamed(
      AppRoutes.IN_APP_WEBVIEW,
      arguments: {'title': 'About Us', 'url': 'https://yeppads.com/about-us'},
    );
  }

  void onAdvertiseTap() {
    Get.toNamed(AppRoutes.USER_LOGIN);
  }

  void onContactUsTap() {
    Get.toNamed(
      AppRoutes.IN_APP_WEBVIEW,
      arguments: {'title': 'Contact Us', 'url': 'https://yeppads.com/contact-us'},
    );
  }

  void onHelpSupportTap() {
    Get.toNamed(
      AppRoutes.IN_APP_WEBVIEW,
      arguments: {'title': 'Help & Support', 'url': 'https://yeppads.com/help-support'},
    );
  }

  void onPrivacyPolicyTap() {
    Get.toNamed(
      AppRoutes.IN_APP_WEBVIEW,
      arguments: {'title': 'Privacy Policy', 'url': 'https://yeppads.com/privacy-policy'},
    );
  }

  void onTermsTap() {
    Get.toNamed(
      AppRoutes.IN_APP_WEBVIEW,
      arguments: {'title': 'Terms & Conditions', 'url': 'https://yeppads.com/terms-and-conditions'},
    );
  }

  void onRateAppTap() {
    // Logic to rate app
  }

  void onInviteFriendsTap(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await SharePlus.instance.share(
      ShareParams(
        title: 'Get best deals on Yepp!',
        subject: 'Download Yepp',
        text: '''
🔥 Get the best deals on Yepp!

Shop smarter and save more with amazing offers. Download the app now!

Available on Android & iOS.
''',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  void onLogoutTap() {
    // Logout logic
  }
}
