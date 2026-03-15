import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
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
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorLoginController extends GetxController {
  final obscure = true.obs;

  /// Default values for email and password
  final emailController = TextEditingController(text: "nayemalways.sm@gmail.com").obs;
  final passwordController = TextEditingController(text: "nayem@@Ahmed007").obs;
  RxBool loading = false.obs;

  final DioClient _dioClient = DioClient();
  final DeviceInfoService _deviceInfoService = DeviceInfoService();
  final StorageService _storageService = StorageService();

  /// for google login

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

  /// for google login

  Future<void> loginWithGoogleDeepLink() async {
    loading.value = true;

    final AppLinks appLinks = AppLinks();
    StreamSubscription<Uri>? sub;

    try {
      // Step 1: Listen for deep link callback
      sub = appLinks.uriLinkStream.listen((Uri uri) async {
        if (uri.scheme == "yeppapp" && uri.path == "/auth/google") {
          final accessToken = uri.queryParameters['access'];
          final refreshToken = uri.queryParameters['refresh'];

          if (accessToken != null && refreshToken != null) {
            _storageService.setAccessToken(accessToken);
            _storageService.setRefreshToken(refreshToken);

            _storeUserId();

            Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
          } else {
            Get.snackbar("Error", "Failed to get token from Google login");
          }

          await sub?.cancel();
        }
      });

      // Step 2: Open browser with your API
      final url = Uri.parse(
        '${ApiConstants.baseUrl}/auth/google?redirect_uri=myapp://google-login',
      );

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        Get.snackbar("Error", "Could not launch login URL");
        return;
      }
    } catch (e, st) {
      _handleException(e, st);
    } finally {
      loading.value = false;
    }
  }

  /// Login API call
  Future<void> loginApi() async {
    debugPrint("loginApi started");

    loading.value = true;
    debugPrint("Loading set to true");

    try {
      debugPrint("Calling _performLoginRequest...");
      final response = await _performLoginRequest();
      debugPrint("Login request completed");

      debugPrint("Response status code: ${response.statusCode}");
      debugPrint("Response data: ${response.data}");

      if (response.statusCode == 200) {
        debugPrint("Login success (status 200)");

        // Handle successful login response
        var data = response.data;
        debugPrint("Parsed response data");

        _storeLoginTokens(data);
        debugPrint("Login tokens stored");

        _storeUserId();
        debugPrint("User ID stored");

        // Register FCM and Device
        debugPrint("Registering FCM...");
        bool fcmRegistered = await _registerFCM();
        debugPrint("FCM registration result: $fcmRegistered");

        if (!fcmRegistered) {
          debugPrint("FCM registration failed");
          Get.snackbar('Error', 'An error occurred while initializing notifications!');
          return;
        }

        debugPrint("Registering device...");
        bool deviceRegistered = await _registerDevice(data);
        debugPrint("Device registration result: $deviceRegistered");

        if (!deviceRegistered) {
          debugPrint("Device registration failed");
          Get.snackbar('Error', 'An error occurred while registering the device.');
          return;
        }

        debugPrint("Saving loggedIn flag in storage...");
        _storageService.write('loggedIn', true);
        debugPrint("loggedIn flag saved");

        debugPrint("Checking verification/shop creation...");
        isVerifiedOrIsShopCreated();
        debugPrint("Verification check executed");

        // Get.snackbar("Login Successful", "");
        // Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
      } else {
        debugPrint("Login failed with status code: ${response.statusCode}");
        _handleError(response.statusCode ?? 0);
      }
    } catch (e, stackTrace) {
      debugPrint("Exception occurred: $e");
      debugPrint("StackTrace: $stackTrace");
      _handleException(e, stackTrace);
    } finally {
      loading.value = false;
      debugPrint("Loading set to false");
      debugPrint("loginApi finished");
    }
  }

  // Login with Apple
  Future<void> loginWithApple(AuthorizationCredentialAppleID credential) async {
    loading.value = true;
    // debugPrint(credential);
    // debugPrint(credential.authorizationCode);
    // debugPrint(credential.identityToken);
    // debugPrint(credential.userIdentifier);
    try {
      final response = await _performAppleLoginRequest(credential.authorizationCode);

      if (response.statusCode == 200) {
        // Handle successful login response
        var data = response.data;
        _storeLoginTokens(data);
        _storeUserId();

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

        _storageService.write('loggedIn', true);

        // Proceed to the next screen
        isVerifiedOrIsShopCreated();

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

  /// Perform Apple login request
  Future<Response<dynamic>> _performAppleLoginRequest(String authorizationCode) {
    return _dioClient.client.post(ApiConstants.vendorAppleLogin, data: {"code": authorizationCode});
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
  void _storeUserId() async {
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
