import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../about_us/views/About_View.dart';
import '../../contact_us/contact_view/contact_us_view.dart';
import '../../help_support/help_support_view/Help_Support_View.dart';
import '../../privacy_policy/privacy_policy_view/Privacy_Policy_View.dart';
import '../../terms_condition/terms_condition_view/Terms_Condition_View.dart';

class MenuController extends GetxController {
  final navController = Get.find<UserNavigationBarController>();
  // Profile/Login
  void onLoginTap() {
    Get.offAllNamed(AppRoutes.USER_LOGIN);
  }

  void goToAbout() {
    navController.openOverlayPage(const AboutView());
  }

  void onAdvertiseTap() {
    Get.toNamed(AppRoutes.USER_LOGIN);
  }

  void onContactUsTap() {
    navController.openOverlayPage(const ContactUsView());
  }

  void onHelpSupportTap() {
    navController.openOverlayPage(const HelpSupportView());
  }

  void onPrivacyPolicyTap() {
    navController.openOverlayPage(const PrivacyPolicyView());
  }

  void onTermsTap() {
    navController.openOverlayPage(const TermsConditionView());
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
