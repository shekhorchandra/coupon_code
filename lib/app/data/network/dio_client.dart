import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final StorageService _storageService = StorageService();

  Dio get client => _dio;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: 'application/json',
    ),
  );

  DioClient() {
    // Add PrettyDioLogger for pretty logging
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true, // Show request headers
        requestBody: true, // Show request body
        responseHeader: true, // Show response headers
        responseBody: true, // Show response body
        error: true, // Show errors
        compact: false, // Use compact mode (set to false for pretty print)
        maxWidth: 90, // Set the maximum width of the log
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Set Authorization header
          options.headers["Accept"] = "application/json";
          String? token = _storageService.accessToken;
          if (token != null) options.headers["Authorization"] = 'Bearer $token';

          print("Request to: ${options.method} ${options.uri}");
          print("Headers: ${options.headers}");
          print("Request Body: ${options.data}");

          return handler.next(options);
        },
        onError: (error, handler) async {
          print("Error Status: ${error.response?.statusCode}");
          print("Error Message: ${error.message}");
          if (error.response != null) {
            print("Error Response Data: ${error.response?.data}");
          }

          onError: (error, handler) async {
            print("Error Status: ${error.response?.statusCode}");
            print("Error Message: ${error.message}");

            final data = error.response?.data;

            if (data != null) {
              print("Error Response Data: $data");
            }

            // Only try to read message if response is JSON
            if (data is Map && data['message'] == "jwt expired") {
              final newAccessToken = await refreshToken();

              if (newAccessToken != null) {
                error.requestOptions.headers["Authorization"] = 'Bearer $newAccessToken';
                final opts = Options(
                  method: error.requestOptions.method,
                  headers: error.requestOptions.headers,
                );

                final cloneReq = await _dio.request(
                  error.requestOptions.path,
                  options: opts,
                  data: error.requestOptions.data,
                  queryParameters: error.requestOptions.queryParameters,
                );

                return handler.resolve(cloneReq);
              }
            }

            return handler.next(error);
          };
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = _storageService.refreshToken;

      final response = await _dio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['data']['newAccessToken'];
        _storageService.setAccessToken(newAccessToken);

        final newRefreshToken = response.data['data']['newRefreshToken'];
        _storageService.setRefreshToken(newRefreshToken);

        return newAccessToken;
      } else {
        _storageService.clear();
        Get.offAllNamed(AppRoutes.VENDOR_LOGIN);
      }
    } catch (e) {
      _storageService.clear();
      Get.offAllNamed(AppRoutes.VENDOR_LOGIN);
    }
    return null;
  }
}
