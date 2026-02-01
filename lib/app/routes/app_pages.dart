import 'package:coupon_code/app/modules/vendor/vendor_dashboard/bindings/vendor_dashboard_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/bindings/vendor_deals_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/add_deal_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/vendor_deals_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/bindings/vendor_menu_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/vendor_menu_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/bindings/vendor_navigation_bar_binding.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/views/vendor_navigation_bar_view.dart';
import 'package:get/get.dart';

import '../modules/auth/forget/controllers/forgot_controller.dart';
import '../modules/auth/forget/views/forgot_view.dart';
import '../modules/auth/user/login/bindings/user_login_binding.dart';
import '../modules/auth/user/login/views/user_login_view.dart';
import '../modules/auth/user/signup/bindings/user_signup_binding.dart';
import '../modules/auth/user/signup/views/user_signup_view.dart';
import '../modules/auth/vendor/login/vendor_login_binding.dart';
import '../modules/auth/vendor/login/vendor_login_view.dart';
import '../modules/auth/vendor/signup/vendor_signup_binding.dart';
import '../modules/auth/vendor/signup/vendor_signup_view.dart';
import '../modules/common/onboarding/bindings/onboarding_binding.dart';
import '../modules/common/onboarding/views/onboarding_view.dart';
import '../modules/common/splash/bindings/splash_binding.dart';
import '../modules/common/splash/views/splash_view.dart';
import '../modules/user/bottom_nav_bar/bindings/user_navigation_bar_binding.dart';
import '../modules/user/bottom_nav_bar/views/bottom_nav_view.dart';
import '../modules/user/categories/Category/bindings/categories_binding.dart';
import '../modules/user/categories/Category/controllers/categories_controller.dart';
import '../modules/user/categories/Category/views/Categories_View.dart';
import '../modules/user/categories/category_details/views/categoty_details_view.dart';
import '../modules/user/discover_bar/Discover/bindings/discover_binding.dart';
import '../modules/user/discover_bar/Discover/views/discover_view.dart';
import '../modules/user/discover_bar/discover_details/views/discover_details_view_page.dart';
import '../modules/user/menu/about_us/bindings/About_Binding.dart';
import '../modules/user/menu/about_us/views/About_View.dart';
import '../modules/user/menu/contact_us/contact_view/contact_us_view.dart';
import '../modules/user/menu/help_support/help_support_view/Help_Support_View.dart';
import '../modules/user/menu/menu_bar/menu_binding/menu_binding.dart';
import '../modules/user/menu/menu_bar/menu_view/menu_view.dart';
import '../modules/user/menu/privacy_policy/privacy_policy_view/Privacy_Policy_View.dart';
import '../modules/user/menu/terms_condition/terms_condition_view/Terms_Condition_View.dart';
import '../modules/user/saved/views/save_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    /// Splash Screen
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    /// User Bottom Nav Bar
    GetPage(
      name: AppRoutes.USER_BOTTOM_NAV,
      page: () => const UserNavigationBarPage(),
      binding: UserNavigationBinding(),
    ),

    GetPage(
      name: AppRoutes.DISCOVER,
      page: () => const DiscoverView(),
      binding: DiscoverBinding(),
    ),

    GetPage(name: AppRoutes.DISCOVERDETAILS, page: () => ServiceDetailsPage()),

    GetPage(
      name: AppRoutes.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),

    GetPage(
      name: AppRoutes.CATEGORIESDETAILS,
      page: () => CategotyDetails(),
      binding: BindingsBuilder(() {
        Get.put(CategoriesController());
      }),
    ),

    GetPage(name: AppRoutes.SAVED, page: () => UserMySavesPage()),

    GetPage(
      name: AppRoutes.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),

    ///Bottom Nav Bar
    GetPage(name: AppRoutes.DISCOVERDETAILS, page: () => ServiceDetailsPage()),

    GetPage(name: AppRoutes.CATEGORIES, page: () => const CategoriesView()),

    GetPage(
      name: AppRoutes.CATEGORIESDETAILS,
      page: () => const CategotyDetails(),
    ),

    GetPage(name: AppRoutes.DISCOVERDETAILS, page: () => ServiceDetailsPage()),

    GetPage(name: AppRoutes.CATEGORIES, page: () => const CategoriesView()),

    GetPage(
      name: AppRoutes.CATEGORIESDETAILS,
      page: () => const CategotyDetails(),
    ),

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
    GetPage(
      name: AppRoutes.ADD_DEAL,
      page: () => const AddDealView(),
      binding: VendorDealsBinding(),
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
    GetPage(
      name: AppRoutes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
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

    /// Contact Us
    GetPage(name: AppRoutes.CONTACT_US, page: () => const ContactUsView()),

    /// Help and Support
    GetPage(name: AppRoutes.HELP_SUPPORT, page: () => const HelpSupportView()),

    /// Terms and conditions
    GetPage(
      name: AppRoutes.TERMSCONDITION,
      page: () => const TermsConditionView(),
    ),

    /// Privacy Policy
    GetPage(
      name: AppRoutes.PRIVACYPOLICY,
      page: () => const PrivacyPolicyView(),
    ),
  ];
}
