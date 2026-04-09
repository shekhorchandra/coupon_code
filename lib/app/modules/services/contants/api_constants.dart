class ApiConstants {
  static const String baseUrl = "https://api.yeppads.com/api/v1";
  // static const String baseUrl = "https://gastrotomic-squirrelly-yuonne.ngrok-free.dev/api/v1";

  // Define endpoints

  // Auth endpoints
  static const String forgetPassword = "/auth/forget_password/";
  static const String resetPassword = "/auth/reset_password";

  // vendor login and signup
  static const String vendorLogin = "/auth/login";
  static const String vendorAppleLogin = "/auth/apple";
  static const String vendorAppleLoginCallback = "/auth/apple/callback";
  static const String vendorRegister = "/user/register";
  // static const String register = "/auth/register";
  // static const String getProfile = "/user/profile";
  static const String refreshToken = '/auth/generate_token';
  static const String sendOtp = '/user/verification_otp';
  static const String verifyOtp = '/user/verify_profile';

  static const String fcmRegister = '/user/register_fcm';
  static const String fcmUnregister = '/user/unregister_fcm';

  // User profile
  static const String getMe = '/user/get_me';
  static const String updateUser = '/user';

  //user category
  static const String category = "/category";

  // Shop
  static const String createShop = '/shop/create_shop';
  static const String shopDetails = '/shop/shop_details';
  static String updateShop(String id) => '/shop/update_shop/$id';
  static const String shopAnalytics = '/shop/analytics';
  static const String yearlyAnalytics = '/shop/yearly_analytics';

  // Deal
  static const String myDeals = '/service/my_deals';
  static const String topViewedDeals = '/service/top_viewed_deals';
  static const String addDeal = '/service';
  static String dealDetails(String id) => '/service/$id';
  static String serviceDetails(String id, double lng, double lat) => '/service/$id/$lng/$lat';

  // Deal
  static String getDeals(String longitude, String latitude) =>
      '/service/deals/$longitude/$latitude';

  /// user saved deals
  static const String savedDeals = "/service/saved";

  /// category details
  static String categoryDeals(String categoryId) => "/service/c/$categoryId";

  /// Notification
  static const String notifications = '/notification';

  /// Purchase
  static const String verifyPurchaseGoogle = '/payment/api/google_in_app_purchase';
  static const String verifyPurchaseApple = '/payment/api/apple_in_app_purchase';
}
