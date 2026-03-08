import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../services/contants/api_constants.dart';
import '../discover_widget/deal_card_model.dart';

class DiscoverController extends GetxController {
  final searchQuery = ''.obs;
  final deals = <DealCardModel>[].obs; // use DealCardModel
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchDeals();
    super.onInit();
  }

  void onSearch(String value) {
    searchQuery.value = value;
  }

  void onZipPressed() {}
  void onLocationPressed() {}
  void onNotificationPressed() {}

  Future<void> fetchDeals({int page = 1}) async {
    try {
      isLoading.value = true;

      final double lat = 90.4293804;
      final double lng = 23.7587992;

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/$lat/$lng',
        queryParameters: {
          "page": page,
          "limit": 10,
        },
      );

      final Map<String, dynamic> res = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];

        deals.value =
            items.map((e) => DealCardModel.fromJson(e)).toList();

        print("Deals loaded: ${deals.length}");
      } else {
        print("Failed: ${res['message']}");
      }
    } catch (e) {
      if (e is DioException) {
        print("Dio error: ${e.response?.data}");
      } else {
        print("Error: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }
}