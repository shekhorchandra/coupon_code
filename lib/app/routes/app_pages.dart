import 'package:coupon_code/app/modules/vendor/vendor_account/bindings/vendor_account_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/create_vendor_account_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/bindings/vendor_dashboard_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/bindings/vendor_deals_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/vendor_deals_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/bindings/vendor_menu_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/vendor_menu_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/bindings/vendor_navigation_bar_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/views/vendor_navigation_bar_view.dart';
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
    GetPage(
      name: AppRoutes.CREATE_VENDOR_ACCOUNT,
      page: () => CreateVendorAccountPage(),
      binding: VendorAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.VENDOR_DASHBOARD,
      page: () => VendorDashboardPage(),
      binding: VendorDashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.VENDOR_DEALS,
      page: () => VendorDealsPage(),
      binding: VendorDealsBinding(),
    ),
    GetPage(
      name: AppRoutes.VENDOR_MENU,
      page: () => VendorMenuPage(),
      binding: VendorMenuBinding(),
    ),
    GetPage(
      name: AppRoutes.VENDOR_NAVIGATION_BAR,
      page: () => VendorNavigationBarPage(),
      binding: VendorNavigationBarBinding(),
    ),

    /// About Us
    GetPage(name: AppRoutes.ABOUT, page: () => const AboutView(), binding: AboutBinding()),
  ];
}
