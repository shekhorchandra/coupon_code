import 'dart:async';
import 'dart:developer';
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
import 'package:url_launcher/url_launcher.dart';

class VendorLoginController extends GetxController {
  final obscure = true.obs;

  /// Default values for email and password
  final emailController = TextEditingController(text: "").obs;
  final passwordController = TextEditingController(text: "").obs;
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
      isVerifiedOrIsShopCreated();
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

            // Register FCM and Device
            bool fcmRegistered = await _registerFCM();

            if (!fcmRegistered) {
              Get.snackbar('Error', 'An error occurred while initializing notifications!');
              return;
            }

            bool deviceRegistered = await _registerDevice();

            if (!deviceRegistered) {
              Get.snackbar('Error', 'An error occurred while registering the device.');
              return;
            }

            await _storageService.write('loggedIn', true);

            await isVerifiedOrIsShopCreated();

            Get.snackbar("Login Successful", "");
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

  /// Apple Login with Deeplink [New]
  Future<void> loginWithAppleDeepLink() async {
    loading.value = true;

    final AppLinks appLinks = AppLinks();
    StreamSubscription<Uri>? sub;

    try {
      // Step 1: Listen for deep link callback
      sub = appLinks.uriLinkStream.listen((Uri uri) async {
        if (uri.scheme == "yeppapp" && uri.path == "/auth/apple") {
          final accessToken = uri.queryParameters['access'];
          final refreshToken = uri.queryParameters['refresh'];

          if (accessToken != null && refreshToken != null) {
            _storageService.setAccessToken(accessToken);
            _storageService.setRefreshToken(refreshToken);

            _storeUserId();

            // Register FCM and Device
            bool fcmRegistered = await _registerFCM();

            if (!fcmRegistered) {
              Get.snackbar('Error', 'An error occurred while initializing notifications!');
              return;
            }

            bool deviceRegistered = await _registerDevice();

            if (!deviceRegistered) {
              Get.snackbar('Error', 'An error occurred while registering the device.');
              return;
            }

            await _storageService.write('loggedIn', true);

            await isVerifiedOrIsShopCreated();

            Get.snackbar("Login Successful", "");
          } else {
            Get.snackbar("Error", "Failed to get token from Google login");
          }

          await sub?.cancel();
        }
      });

      // Step 2: Open browser with your API
      final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.vendorAppleLogin}');

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
    loading.value = true;

    try {
      final response = await _performLoginRequest();

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

        bool deviceRegistered = await _registerDevice();

        if (!deviceRegistered) {
          Get.snackbar('Error', 'An error occurred while registering the device.');
          return;
        }

        _storageService.write('loggedIn', true);

        await isVerifiedOrIsShopCreated();

        Get.snackbar("Login Successful", "");
      } else {
        _handleError(response.statusCode ?? 0);
      }
    } catch (e, stackTrace) {
      _handleException(e, stackTrace);
    }
  }

  // Login with Apple
  // Future<void> loginWithApple(AuthorizationCredentialAppleID credential) async {
  //   loading.value = true;
  //   // inspect(credential);
  //   // debugPrint(credential.authorizationCode);
  //   // debugPrint(credential.identityToken);
  //   // debugPrint(credential.userIdentifier);

  //   // Apple Login Response
  //   // authorizationCode = "c679fb0a20bcf4ffd931cb5068278ccc6.0.sruvs.xKyowI2gKAPh..."
  //   // email = null
  //   // familyName = null
  //   // givenName = null
  //   // identityToken = "eyJraWQiOiI1aXEzM2xKQllqIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiYWdlbmN5LmJldXB0ZWNoLnllc…"
  //   // state = null
  //   // userIdentifier = "001452.2b850f37f0784c339308e5cee10e499a.01.."
  //   try {
  //     final response = await _performAppleLoginRequest(credential);

  //     if (response.statusCode == 200) {
  //       // Handle successful login response
  //       var data = response.data;
  //       _storeLoginTokens(data);
  //       _storeUserId();

  //       // Register FCM and Device
  //       bool fcmRegistered = await _registerFCM();
  //       if (!fcmRegistered) {
  //         Get.snackbar('Error', 'An error occurred while initializing notifications!');
  //         return;
  //       }

  //       bool deviceRegistered = await _registerDevice();
  //       if (!deviceRegistered) {
  //         Get.snackbar('Error', 'An error occurred while registering the device.');
  //         return;
  //       }

  //       _storageService.write('loggedIn', true);

  //       // Proceed to the next screen
  //       isVerifiedOrIsShopCreated();

  //       Get.snackbar("Login Successful", "");
  //       Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
  //     } else {
  //       _handleError(response.statusCode ?? 0);
  //     }
  //   } catch (e, stackTrace) {
  //     _handleException(e, stackTrace);
  //   } finally {
  //     loading.value = false;
  //   }
  // }

  /// Perform login request
  Future<Response<dynamic>> _performLoginRequest() {
    return _dioClient.client.post(
      ApiConstants.vendorLogin,
      data: {"email": emailController.value.text, "password": passwordController.value.text},
    );
  }

  /// Perform Apple login request
  // Future<Response<dynamic>> _performAppleLoginRequest(AuthorizationCredentialAppleID credential) {
  //   final String? fullName = (credential.givenName != null && credential.familyName != null)
  //       ? "${credential.givenName} ${credential.familyName}"
  //       : null;

  //   return _dioClient.client.post(
  //     ApiConstants.vendorAppleLogin,
  //     data: {
  //       "code": credential.authorizationCode,
  //       "user_name": fullName,
  //       "email": credential.email,
  //     },
  //   );
  // }

  /// Register FCM
  Future<bool> _registerFCM() async {
    final result = await FCMService().initFCM();
    return result;
  }

  /// Register device
  Future<bool> _registerDevice() async {
    try {
      // Device and Token
      var deviceInfo = await _deviceInfoService.getDeviceInfo();
      log(deviceInfo.toString());
      final deviceId = deviceInfo['deviceId'];
      log(deviceId ?? '');
      final token = _storageService.read('fcm_token').toString();
      log(token);
      final platform = Platform.isAndroid ? 'ANDROID' : 'IOS';
      log(platform);
      final deviceName = deviceInfo['deviceName'];
      log(deviceName ?? '');

      // Save to the local storage
      await _storageService.write('device_id', deviceId);
      log("Device ID saved!");

      // Send to the backend
      log("Sending to backend.....");
      final response = await _dioClient.client.post(
        ApiConstants.fcmRegister,
        data: {
          "deviceId": deviceId,
          "token": token,
          "platform": platform,
          "deviceName": deviceName,
        },
      );
      log("Sent.............");

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
    var loggedIn = _storageService.read('loggedIn');
    if (loggedIn == null || loggedIn == false) {
      return Get.toNamed(AppRoutes.VENDOR_LOGIN);
    }

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
    } finally {
      loading.value = false;
    }
  }
}
