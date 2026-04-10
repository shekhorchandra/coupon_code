import 'dart:developer';

import 'package:coupon_code/app/data/models/user_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  DioClient _dioClient = DioClient();

  var user = UserModel().obs;
  var isLoading = false.obs;
  var isPasswordLoading = false.obs;
  RxBool fullPageLoading = false.obs;

  // Main Profile Controllers
  late TextEditingController usernameController;
  late TextEditingController emailController;

  // Password Update Controllers (Separate)
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  final profileFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
    usernameController = TextEditingController(text: user.value.username);
    emailController = TextEditingController(text: user.value.email);

    // Initialize password controllers
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> fetchUserInfo() async {
    isLoading.value = true;
    try {
      final response = await _dioClient.client.get(ApiConstants.getMe);

      if (response.statusCode == 200) {
        user.value = UserModel.fromJson(response.data['data']);

        usernameController.text = user.value.username ?? '';
        emailController.text = user.value.email ?? '';
      }
    } finally {
      isLoading.value = false;
    }
  }

  // --- Update Profile Info (Username/Email) ---
  Future<void> updateUserInfo() async {
    if (!profileFormKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      final response = await _dioClient.client.patch(
        ApiConstants.updateUser,
        data: {"user_name": usernameController.text, "email": emailController.text},
      );

      if (response.statusCode == 200) {
        user.update((val) {
          val?.username = usernameController.text.trim();
          val?.email = emailController.text.trim();
        });

        Get.snackbar('Success', 'Profile updated successfully!');
      }
    } finally {
      isLoading.value = false;
    }
  }

  // --- Update Password Logic ---
  Future<void> updatePassword(oldPassword, newPassword) async {
    if (!passwordFormKey.currentState!.validate()) return;

    isPasswordLoading.value = true;
    try {
      final response = await _dioClient.client.post(
        ApiConstants.changePassword,
        data: {"oldPassword": oldPassword, "newPassword": newPassword},
      );

      if (response.statusCode == 200) {
        // Clear fields after success
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        Get.back(); // Close bottom sheet
        Get.snackbar(
          "Success",
          "Password changed successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar("Error", "Failed to update password");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update password");
    } finally {
      isPasswordLoading.value = false;
    }
  }

  // Delete Account
  Future<void> deleteAccount() async {
    Get.back();

    try {
      if (currentPasswordController.text.isNotEmpty) {
        isLoading.value = true;

        // Verify Password
        final response = await _dioClient.client.post(
          ApiConstants.vendorLogin,
          data: {
            "email": emailController.value.text,
            "password": currentPasswordController.value.text,
          },
        );

        if (response.statusCode == 200) {
          final response = await DioClient().client.delete(ApiConstants.deleteUser);

          if (response.statusCode == 200) {
            Get.snackbar('Account deleted successfully!', '', barBlur: 0);

            Get.put(() => VendorMenuController().logout());
          } else {
            Get.snackbar('Error', 'Failed to delete your account!');
          }
        } else {
          Get.snackbar('Authentication Error', '');
        }
      } else {
        Get.snackbar('Password Required', 'Please enter your password!');
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      currentPasswordController.clear();
    }
  }
}
