import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/shop_analytics_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class VendorDashboardController extends GetxController {
  var deals = <DealModel>[].obs;
  var isLoading = true.obs;

  DioClient _dioClient = DioClient();
  Rx<ShopAnalyticsModel> shopAnalytics = Rx<ShopAnalyticsModel>(
    ShopAnalyticsModel(activeDeals: -1, totalViews: -1, totalImpressions: -1),
  );
  RxDouble ctr = (-1.0).obs;

  @override
  void onInit() async {
    await loadDeals();
    await getShopAnalytics();

    super.onInit();
  }

  Future<void> loadDeals() async {
    try {
      isLoading(true);

      // Fetch deals from API
      final response = await _dioClient.client.get(ApiConstants.topViewedDeals);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data']['topDeals'];
        final List<DealModel> loadedDeals = responseData.map((dealData) {
          return DealModel.fromMap(dealData);
        }).toList();

        deals.assignAll(loadedDeals);

        print(loadedDeals);
      } else {
        Get.snackbar('Error', 'Failed to load deals!');
      }
    } catch (e) {
      debugPrint("Error loading deals: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<bool> getShopAnalytics() async {
    isLoading.value = true;

    try {
      final response = await _dioClient.client.get(ApiConstants.shopAnalytics);

      if (response.statusCode == 200) {
        shopAnalytics.value = ShopAnalyticsModel.fromMap(response.data['data']);

        // Calculate the CTR
        ctr.value = (shopAnalytics.value.totalImpressions > 0)
            ? (shopAnalytics.value.totalViews / shopAnalytics.value.totalImpressions) * 100
            : 0.0;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error has occured! Error: $e');

      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
