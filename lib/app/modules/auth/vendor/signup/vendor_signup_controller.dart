import 'dart:convert';

import 'package:coupon_code/app/modules/services/Helper_status_code/HttpStatusHandler.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorSignupController extends GetxController {
  ///Text controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ///UI Part
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final isSubmitting = false.obs;

  /// Toggle password hide and visible
  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  /// Validation function
  String? validateForm() {
    if (userNameController.text.trim().isEmpty) {
      return "User name is required";
    }

    if (emailController.text.trim().isEmpty) {
      return "Email is required";
    }

    if (!GetUtils.isEmail(emailController.text.trim())) {
      return "Enter a valid email address";
    }

    if (passwordController.text.isEmpty) {
      return "Password is required";
    }

    if (passwordController.text.length < 6) {
      return "Password must be at least 6 characters";
    }

    if (confirmPasswordController.text.isEmpty) {
      return "Confirm your password";
    }

    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      return "Passwords do not match";
    }

    return null;
  }

  /// SignUp API call
  Future<void> registerVendor() async {
    if (isSubmitting.value) return;

    /// validation
    final error = validateForm();
    if (error != null) {
      Get.snackbar("Validation Error", error);
      return;
    }

    isSubmitting.value = true;

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.vendorRegister),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "user_name": userNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data["success"] == true) {
        Get.snackbar("Success", data["message"] ?? "User created!!");

        ///Navigate part
        Get.offAllNamed(AppRoutes.VENDOR_LOGIN);
      } else
        Get.snackbar("Registration Failed", HttpStatusHandler.getMessage(response.statusCode));
    } catch (e, stackTrace) {
      debugPrint("Register Error: $e");
      debugPrint("StackTrace: $stackTrace");

      Get.snackbar("Error", "Unable to register. Please try again");
    } finally {
      isSubmitting.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
