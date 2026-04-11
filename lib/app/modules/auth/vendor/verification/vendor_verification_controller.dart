import 'dart:async';
import 'dart:developer';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/auth/vendor/login/vendor_login_controller.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorVerificationController extends GetxController {
  VendorVerificationController();

  RxString email = ''.obs;

  var otpCode = "".obs;
  var secondsRemaining = 30.obs;
  var canResend = false.obs;
  Timer? _timer;

  final DioClient _dioClient = DioClient();

  @override
  void onInit() async {
    await _getEmail();

    sendOtp();
    startTimer();
    super.onInit();
  }

  Future<void> _getEmail() async {
    try {
      final response = await _dioClient.client.get(ApiConstants.getMe);

      if (response.statusCode == 200) {
        email.value = response.data['data']['email'];
      } else {
        Get.snackbar('Error', "Couldn't fetch email to send OTP!");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendOtp() async {
    final response = await _dioClient.client.post(
      ApiConstants.sendOtp,
      data: {'email': email.value},
    );

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
      data: {"otp": int.parse(otpCode.value), "email": email.value},
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
