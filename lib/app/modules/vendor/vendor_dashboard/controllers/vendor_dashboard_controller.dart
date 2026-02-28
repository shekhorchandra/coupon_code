import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class VendorDashboardController extends GetxController {
  var deals = <DealModel>[].obs;
  var isLoading = true.obs;

  DioClient _dioClient = DioClient();

  @override
  void onInit() async {
    await loadDeals();

    super.onInit();
  }

  Future<void> loadDeals() async {
    try {
      isLoading(true);

      // Fetch deals from API
      final response = await _dioClient.client.get(ApiConstants.myDeals);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        final List<DealModel> loadedDeals = responseData.map((dealData) {
          return DealModel.fromJson(dealData);
        }).toList();

        deals.assignAll(loadedDeals);
      } else {
        Get.snackbar('Error', 'Failed to load deals!');
      }
    } catch (e) {
      debugPrint("Error loading deals: $e");
    } finally {
      isLoading(false);
    }
  }
}
