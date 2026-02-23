import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../services/contants/api_constants.dart';

class AuthService {
  // static const String baseUrl = "https://gastrotomic-squirrelly-yuonne.ngrok-free.dev/api/v1";

  /// Send OTP to email
  static Future<void> forgetPassword(String email) async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.forgetPassword + email),
      // final response = await http.get(Uri.parse("${ApiConstants.baseUrl}/auth/forget_password/$email"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send OTP");
    }
  }

  /// Verify OTP
  static Future<String> verifyOtp(String email, String otp) async {
    final res = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.verifyOtp),
      // Uri.parse("${ApiConstants.baseUrl}${ApiConstants.verifyOtp}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "otp": otp}),
    );

    final body = jsonDecode(res.body);

    if (res.statusCode == 200 && body["success"] == true) {
      return body["data"]; // TOKEN
    } else {
      throw Exception(body["message"] ?? "OTP verification failed");
    }
  }

  ///  Reset Password
  static Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    final res = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.resetPassword),
      // Uri.parse("${ApiConstants.baseUrl}/auth/reset_password"),
      headers: {
        "Content-Type": "application/json",
        "token": token, // required header
      },
      body: jsonEncode({"newPassword": newPassword}),
    );

    final body = jsonDecode(res.body);

    if (res.statusCode != 200 || body["success"] != true) {
      throw Exception(body["message"] ?? "Reset password failed");
    }
  }
}
