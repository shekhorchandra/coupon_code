import 'package:get/get.dart';
import '../modules/auth/forget/forgot_binding.dart';
import '../modules/auth/forget/forgot_controller.dart';
import '../modules/auth/forget/forgot_view.dart';
import '../modules/discover/discover_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/auth/user/login/user_login_binding.dart';
import '../modules/auth/user/login/user_login_view.dart';
import '../modules/auth/user/signup/user_signup_binding.dart';
import '../modules/auth/user/signup/user_signup_view.dart';
import '../modules/auth/vendor/login/vendor_login_binding.dart';
import '../modules/auth/vendor/login/vendor_login_view.dart';
import '../modules/auth/vendor/signup/vendor_signup_binding.dart';
import '../modules/auth/vendor/signup/vendor_signup_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.DISCOVER,
      page: () => const DiscoverPage(),
    ),

    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
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
      name: AppRoutes.USER_FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController(UserRole.user));
      }),
    ),

    GetPage(
      name: AppRoutes.VENDOR_FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController(UserRole.vendor));
      }),
    ),

  ];
}
