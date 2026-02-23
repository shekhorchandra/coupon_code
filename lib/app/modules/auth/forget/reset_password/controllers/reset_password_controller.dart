import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
import '../../forget_auth_service/ForgetPasswordAuthService.dart';

class ResetPasswordController extends GetxController {
  late String email;
  late String token;

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    email = args["email"];
    token = args["token"];
    super.onInit();
  }

  void resetPassword() async {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      await AuthService.resetPassword(
        token: token,
        newPassword: newPassword,
      );

      Get.snackbar("Success", "Password reset success");

      Get.offAllNamed(AppRoutes.USER_LOGIN);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}