import 'package:get/get.dart';

import '../modules/auth/forget/forgot_controller.dart';
import '../modules/auth/forget/forgot_view.dart';
import '../modules/auth/user/login/user_login_binding.dart';
import '../modules/auth/user/login/user_login_view.dart';
import '../modules/auth/user/signup/user_signup_binding.dart';
import '../modules/auth/user/signup/user_signup_view.dart';
import '../modules/auth/vendor/login/vendor_login_binding.dart';
import '../modules/auth/vendor/login/vendor_login_view.dart';
import '../modules/auth/vendor/signup/vendor_signup_binding.dart';
import '../modules/auth/vendor/signup/vendor_signup_view.dart';
import '../modules/common/onboarding/onboarding_binding.dart';
import '../modules/common/onboarding/onboarding_view.dart';
import '../modules/common/splash/splash_binding.dart';
import '../modules/common/splash/splash_view.dart';
import '../modules/user/discover/discover_view.dart';
import '../modules/user/menu/about_us/About_Binding.dart';
import '../modules/user/menu/about_us/About_View.dart';
import '../modules/user/menu/menu_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    /// Splash Screen
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashView(), binding: SplashBinding()),

    ///Bottom Nav Bar
    GetPage(name: AppRoutes.DISCOVER, page: () => const DiscoverPage()),

    GetPage(name: AppRoutes.MENU, page: () => const MenuView()),

    /// Onboarding all pages
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),

    /// User Part
    GetPage(
      name: AppRoutes.USER_LOGIN,
      page: () => const UserLoginView(),
      binding: UserLoginBinding(),
    ),
    GetPage(
      name: AppRoutes.USER_SIGNUP,
      page: () => const UserSignupView(),
      binding: UserSignupBinding(),
    ),

    /// Vendor Part
    GetPage(
      name: AppRoutes.VENDOR_LOGIN,
      page: () => const VendorLoginView(),
      binding: VendorLoginBinding(),
    ),
    GetPage(
      name: AppRoutes.VENDOR_SIGNUP,
      page: () => const VendorSignupView(),
      binding: VendorSignupBinding(),
    ),

    /// User Forget password
    GetPage(
      name: AppRoutes.USER_FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController(UserRole.user));
      }),
    ),

    /// Vendor Forget password
    GetPage(
      name: AppRoutes.VENDOR_FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController(UserRole.vendor));
      }),
    ),

    /// About Us
    GetPage(name: AppRoutes.ABOUT, page: () => const AboutView(), binding: AboutBinding()),
  ];
}
