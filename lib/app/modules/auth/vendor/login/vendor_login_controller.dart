import 'dart:io';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/data/services/device_info_service.dart';
import 'package:coupon_code/app/data/services/fcm_service.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/Helper_status_code/HttpStatusHandler.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

class VendorLoginController extends GetxController {
  final obscure = true.obs;

  /// Default values for email and password
  final emailController = TextEditingController(text: "shekhor@gmail.com").obs;
  final passwordController = TextEditingController(text: "nayem@@Ahmed017").obs;
  RxBool loading = false.obs;

  final DioClient _dioClient = DioClient();
  final DeviceInfoService _deviceInfoService = DeviceInfoService();
  final StorageService _storageService = StorageService();

  @override
  void onInit() {
    Future.microtask(() => _checkAuthentication());
    super.onInit();
  }

  void _checkAuthentication() async {
    final accessToken = _storageService.accessToken;

    if (accessToken != null) {
      Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
    }
  }

  /// Login API call
  Future<void> loginApi() async {
    loading.value = true;
    try {
      final response = await _performLoginRequest();

      if (response.statusCode == 200) {
        // Handle successful login response
        var data = response.data;
        _storeLoginTokens(data);
        _storeUserId(data);

        // Register FCM and Device
        bool fcmRegistered = await _registerFCM();
        if (!fcmRegistered) {
          Get.snackbar('Error', 'An error occurred while initializing notifications!');
          return;
        }

        bool deviceRegistered = await _registerDevice(data);
        if (!deviceRegistered) {
          Get.snackbar('Error', 'An error occurred while registering the device.');
          return;
        }

        // Proceed to the next screen
        isVerifiedOrIsShopCreated();

        _storageService.write('loggedIn', true);
        // Get.snackbar("Login Successful", "");
        // Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
      } else {
        _handleError(response.statusCode ?? 0);
      }
    } catch (e, stackTrace) {
      _handleException(e, stackTrace);
    } finally {
      loading.value = false;
    }
  }

  /// Perform login request
  Future<Response<dynamic>> _performLoginRequest() {
    return _dioClient.client.post(
      ApiConstants.vendorLogin,
      data: {"email": emailController.value.text, "password": passwordController.value.text},
    );
  }

  /// Register FCM
  Future<bool> _registerFCM() async {
    final result = await FCMService().initFCM();
    return result;
  }

  /// Register device
  Future<bool> _registerDevice(Map<String, dynamic> data) async {
    try {
      // Device and Token
      var deviceInfo = await _deviceInfoService.getDeviceInfo();
      final deviceId = deviceInfo['deviceId'];
      final token = _storageService.read('fcm_token').toString();
      final platform = Platform.isAndroid ? 'ANDROID' : 'IOS';
      final deviceName = deviceInfo['deviceName'];

      // Save to the local storage
      _storageService.write('device_id', deviceId);

      // Send to the backend
      final response = await _dioClient.client.post(
        ApiConstants.fcmRegister,
        data: {
          "deviceId": deviceId,
          "token": token,
          "platform": platform,
          "deviceName": deviceName,
        },
      );

      if (response.statusCode == 400) {
        Get.snackbar('Error', 'You are not verified! Contact with the administrator.');

        return false;
      }

      if (response.statusCode != 200 && response.statusCode != 400) {
        Get.snackbar(
          "Notification Initialization Failed",
          HttpStatusHandler.getMessage(response.statusCode ?? 0),
        );
        return false;
      }

      return true;
    } catch (e) {
      debugPrint("Device Registration Error: $e");
      return false;
    }
  }

  /// Store login tokens in local storage
  void _storeLoginTokens(Map<String, dynamic> data) {
    _storageService.setAccessToken(data['data']['accessToken']);
    _storageService.setRefreshToken(data['data']['refreshToken']);
  }

  /// Store user id in local storage
  void _storeUserId(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.client.get(ApiConstants.getMe);

      if (response.statusCode == 200) {
        _storageService.setUserId(response.data['data']['_id']);
      } else {
        Get.snackbar('Error', 'Couldn\'t fetch user information!');
      }
    } catch (e, st) {
      _handleException(e, st);
    }
  }

  /// Handle error based on HTTP status code
  void _handleError(int statusCode) {
    Get.snackbar("Login Failed", HttpStatusHandler.getMessage(statusCode));
  }

  /// Handle exception during login process
  void _handleException(dynamic e, StackTrace stackTrace) {
    debugPrint("Login Error: $e");
    debugPrint("StackTrace: $stackTrace");
    Get.snackbar("Error", "Something went wrong. Please try again.");
  }

  /// Toggle password visibility
  void togglePassword() {
    obscure.value = !obscure.value;
  }

  /// Login flow
  Future<void> isVerifiedOrIsShopCreated() async {
    try {
      final response = await _dioClient.client.get(ApiConstants.getMe);

      if (response.statusCode == 200) {
        var data = response.data;

        // Check verification
        final isVerified = data['data']['isVerified'];

        if (isVerified) {
          // Check shop creation status
          final isShopCreated = data['data']['isShopCreated'];

          if (isShopCreated) {
            Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
          } else {
            Get.offAllNamed(AppRoutes.CREATE_VENDOR_ACCOUNT);
          }
        } else {
          Get.offAllNamed(
            AppRoutes.VENDOR_VERIFICATION,
            arguments: {"email": emailController.value.text},
          );
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
