import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';
import '../../forget_auth_service/ForgetPasswordAuthService.dart';



enum UserRole { vendor, user }

class ForgotPasswordController extends GetxController {
  final UserRole role;

  ForgotPasswordController(this.role);

  final emailController = TextEditingController();
  final isLoading = false.obs;

  void sendResetLink() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }

    isLoading.value = true;

    try {
      // CALL API
      await AuthService.forgetPassword(email);

      Get.snackbar("Success", "OTP sent to your email");

      //  Navigate to OTP screen
      Get.toNamed(AppRoutes.OTP_VERIFY, arguments: email);

    } catch (e) {
      Get.snackbar("Error", "Failed to send OTP");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}


