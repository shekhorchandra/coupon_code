class ApiConstants {
  static const String baseUrl = "https://gastrotomic-squirrelly-yuonne.ngrok-free.dev/api/v1";

  // Define endpoints
  static const String vendorLogin = "/auth/login";
  static const String vendorRegister = "/user/register";
  // static const String register = "/auth/register";
  // static const String getProfile = "/user/profile";
  static const String refreshToken = '/auth/generate_token';

  static const String fcmRegister = '/user/register_fcm';
  static const String fcmUnregister = '/user/unregister_fcm';
}
