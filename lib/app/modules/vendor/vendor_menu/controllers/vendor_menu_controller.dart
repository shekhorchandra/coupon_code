import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:get/get.dart';

class VendorMenuController extends GetxController {
  VendorMenuController();

  RxBool loading = false.obs;

  final DioClient _dioClient = DioClient();
  final StorageService _storageService = StorageService();

  Future<void> logout() async {
    loading.value = true;

    try {
      // Remove tokens
      await _storageService.clear();

      // Remove FCM
      final response = await _dioClient.client.post(ApiConstants.fcmUnregister);

      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.USER_BOTTOM_NAV);
      } else {
        Get.snackbar('Error', 'Failed to log out!');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured: $e');
    } finally {
      loading.value = false;
    }
  }
}
