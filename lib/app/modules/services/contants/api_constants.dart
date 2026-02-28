class ApiConstants {
  static const String baseUrl = "https://gastrotomic-squirrelly-yuonne.ngrok-free.dev/api/v1";

  // Define endpoints

  // Auth endpoints
  static const String forgetPassword = "/auth/forget_password/";
  static const String resetPassword = "/auth/reset_password";

  // vendor login and signup
  static const String vendorLogin = "/auth/login";
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

  //user category
  static const String category = "/category";

  // Shop
  static const String createShop = '/shop/create_shop';
  static const String shopDetails = '/shop/shop_details';

  // Deal
  static const String myDeals = '/service/my_deals';
  static String dealDetails(String id) => '/service/$id';
}
