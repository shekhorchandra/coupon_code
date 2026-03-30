import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final StorageService _storageService = StorageService();
  late final Dio _dio;

  bool _isRefreshing = false;

  Dio get client => _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 90),
        responseType: ResponseType.json,
        contentType: 'application/json',
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(requestBody: true, responseBody: true, error: true, compact: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Accept"] = "application/json";

          final token = _storageService.accessToken;

          if (token != null && token.isNotEmpty && !_isAuthEndpoint(options.path)) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },

        onError: (DioException error, handler) async {
          final requestOptions = error.requestOptions;

          if (error.response?.statusCode == 400) {
            print(error.response?.data);
            Get.snackbar('Error', error.response?.data['message']);
          }

          final isUnauthorized =
              error.response?.statusCode == 401 ||
              error.response?.statusCode == 403 ||
              (error.response?.data is Map && error.response?.data['message'] == "jwt expired");

          // Prevent infinite loop
          final alreadyRetried = requestOptions.extra['retried'] == true;

          if (isUnauthorized &&
              !alreadyRetried &&
              !_isAuthEndpoint(requestOptions.path) &&
              _storageService.refreshToken != null) {
            requestOptions.extra['retried'] = true;

            if (!_isRefreshing) {
              _isRefreshing = true;

              final newToken = await refreshToken();

              _isRefreshing = false;

              if (newToken != null) {
                final response = await _retry(requestOptions);
                return handler.resolve(response);
              } else {
                _handleLogout();
              }
            } else {
              await Future.delayed(const Duration(milliseconds: 500));
              final response = await _retry(requestOptions);
              return handler.resolve(response);
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  bool _isAuthEndpoint(String path) {
    return path.contains(ApiConstants.vendorLogin) || path.contains(ApiConstants.refreshToken);
  }

  Future<Response> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        "Authorization": "Bearer ${_storageService.accessToken}",
      },
      extra: requestOptions.extra,
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = _storageService.refreshToken;

      if (refreshToken == null) return null;

      final refreshDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

      final response = await refreshDio.post(
        ApiConstants.refreshToken,
        data: {"refreshToken": refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];

        final newAccessToken = data['newAccessToken'];
        final newRefreshToken = data['newRefreshToken'];

        await _storageService.setAccessToken(newAccessToken);
        await _storageService.setRefreshToken(newRefreshToken);

        return newAccessToken;
      }
    } catch (e) {
      _handleLogout();
    }

    return null;
  }

  void _handleLogout() async {
    try {
      String? deviceId = await _storageService.read('device_id');

      if (deviceId != null) {
        _dio.patch(ApiConstants.fcmUnregister, data: {"deviceId": deviceId});
      }
    } catch (_) {}

    await _storageService.clear();

    Get.snackbar("Session Expired", "Please login again");

    Get.offAllNamed(AppRoutes.USER_BOTTOM_NAV);
  }
}
