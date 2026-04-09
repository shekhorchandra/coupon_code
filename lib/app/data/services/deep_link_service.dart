import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:get/get.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();
  DioClient _dioClient = DioClient();
  StorageService _storageService = StorageService();
  StreamSubscription? _sub;

  void init() async {
    // Get link when app starts
    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      handleUri(initialUri);
    }

    // Listen for links while app is running
    _sub = _appLinks.uriLinkStream.listen((Uri uri) {
      handleUri(uri);
    });
  }

  void handleUri(Uri uri) {
    print("Deep link: $uri");

    /// Login with Apple on Android
    /// Check if the deep link contains 'auth/apple'
    if (uri.pathSegments.contains('auth') && uri.pathSegments.contains('apple')) {
      final accessToken = _getQueryParam(uri, 'access');
      final refreshToken = _getQueryParam(uri, 'refresh');

      _loginWithAppleAndroid(accessToken, refreshToken);
    }

    // if (uri.pathSegments.contains('product')) {
    //   final id = uri.pathSegments.last;
    //   // navigate to product page
    // }
  }

  /// Login with Apple
  void _storeUserId() async {
    try {
      final response = await _dioClient.client.get(ApiConstants.getMe);

      if (response.statusCode == 200) {
        _storageService.setUserId(response.data['data']['_id']);
      } else {
        Get.snackbar('Error', 'Couldn\'t fetch user information!');
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  String? _getQueryParam(Uri uri, String param) {
    final queryParams = uri.queryParameters;
    return queryParams[param];
  }

  void _loginWithAppleAndroid(String? accessToken, String? refreshToken) {
    if (accessToken != null && refreshToken != null) {
      _storageService.setAccessToken(accessToken);
      _storageService.setRefreshToken(refreshToken);
      _storeUserId();
      _storageService.write('loggedIn', true);

      Get.snackbar("Success", "Logged in successfully!");
    } else {
      print("Tokens not found!");
    }
  }

  void dispose() {
    _sub?.cancel();
  }
}
