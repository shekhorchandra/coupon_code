import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';

class MenuController extends GetxController {
  final navController = Get.find<UserNavigationBarController>();
  // Profile/Login
  void onLoginTap() {
    Get.offAllNamed(AppRoutes.USER_LOGIN);
  }

  void goToAbout() {
    Get.toNamed(AppRoutes.ABOUT);
  }

  void onAdvertiseTap() {
    Get.toNamed(AppRoutes.USER_LOGIN);
  }

  void onContactUsTap() {
    Get.toNamed(AppRoutes.CONTACT_US);
  }

  void onHelpSupportTap() {
    Get.toNamed(AppRoutes.HELP_SUPPORT);
  }

  void onPrivacyPolicyTap() {
    Get.toNamed(AppRoutes.PRIVACYPOLICY);
  }

  void onTermsTap() {
    Get.toNamed(AppRoutes.TERMSCONDITION);
  }

  void onRateAppTap() {
    // Logic to rate app
  }

  void onInviteFriendsTap() {
    // Logic to invite friends
  }

  void onLogoutTap() {
    // Logout logic
  }
}
