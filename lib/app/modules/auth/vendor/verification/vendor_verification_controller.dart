import 'dart:async';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/auth/vendor/login/vendor_login_controller.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorVerificationController extends GetxController {
  VendorVerificationController();

  final String email = Get.arguments['email'];

  var otpCode = "".obs;
  var secondsRemaining = 30.obs;
  var canResend = false.obs;
  Timer? _timer;

  final DioClient _dioClient = DioClient();

  @override
  void onInit() {
    sendOtp();
    startTimer();
    super.onInit();
  }

  Future<void> sendOtp() async {
    final response = await _dioClient.client.post(ApiConstants.sendOtp, data: {"email": email});

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'OTP has been sent successfully!');
    } else {
      Get.snackbar('Failed', 'Failed to send OTP!');
    }
  }

  void startTimer() {
    canResend.value = false;
    secondsRemaining.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        canResend.value = true;
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtp() async {
    if (otpCode.value.length < 4) {
      Get.snackbar(
        "Error",
        "Please enter a valid 4-digit code",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.bottomSheet(
      const IntrinsicHeight(
        child: Center(
          child: Padding(padding: EdgeInsets.all(20), child: Text("Verifying...")),
        ),
      ),
      backgroundColor: Colors.white,
    );

    final response = await _dioClient.client.post(
      ApiConstants.verifyOtp,
      data: {"otp": int.parse(otpCode.value), "email": email},
    );

    if (response.statusCode == 200) {
      final loginController = Get.put(VendorLoginController());

      // Refresh the token as previous token doesn't know the user is verified now
      await _dioClient.refreshToken();
      loginController.isVerifiedOrIsShopCreated();
    } else {
      Get.snackbar('Failed', response.data['data']['message']);
    }
  }

  void resendOtp() {
    if (canResend.value) {
      startTimer();

      sendOtp();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
