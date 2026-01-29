import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

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
      await Future.delayed(const Duration(seconds: 2)); // simulate API

      if (role == UserRole.user) {
        // TODO: CALL USER FORGOT PASSWORD API
        print("User forgot password API called");
      } else {
        // TODO: CALL VENDOR FORGOT PASSWORD API
        print("Vendor forgot password API called");
      }

      Get.snackbar("Success", "Password reset link sent! Check your email.");

      // Navigate back to correct login
      Get.offNamed(role == UserRole.user ? AppRoutes.USER_LOGIN : AppRoutes.VENDOR_LOGIN);
    } catch (e) {
      Get.snackbar("Error", e.toString());
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
