import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Accept"] = "application/json";
          String? token = _storageService.accessToken;
          options.headers["Authorization"] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final newAccessToken = await refreshToken();

            if (newAccessToken != null) {
              _dio.options.headers["Authorization"] = '$newAccessToken';
              return handler.resolve(await _dio.fetch(error.requestOptions));
            }
          }
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

      final newAccessToken = response.data['accessToken'];
      _storageService.setAccessToken(newAccessToken);

      return newAccessToken;
    } catch (e) {
      _storageService.clear();
      Get.offAllNamed(AppRoutes.VENDOR_LOGIN);
    }
    return null;
  }
}
