import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../services/contants/api_constants.dart';
import '../discover_widget/deal_card_model.dart';

class DiscoverController extends GetxController {
  final searchQuery = ''.obs;
  final deals = <DealCardModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchDeals();
    super.onInit();
  }

  /// SEARCH HANDLER
  void onSearch(String value) {
    searchQuery.value = value;

    final term = value.trim();

    /// if search empty → show default deals
    if (term.isEmpty) {
      fetchDeals();
    } else {
      /// if keyword exists → search API
      fetchDealsWithSearch(searchTerm: term);
    }
  }

  void onZipPressed() {
    final zip = searchQuery.value.trim();

    if (zip.isNotEmpty) {
      fetchDealsWithSearch(searchTerm: zip);
    }
  }
  void onLocationPressed() {}
  void onNotificationPressed() {}

  Future<void> refreshDeals() async {
    await fetchDeals();
  }

  /// DEFAULT DEALS API
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

      final Map<String, dynamic> res =
      response.data is String ? jsonDecode(response.data) : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];

        deals.value = items.map((e) => DealCardModel.fromJson(e)).toList();

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

  /// SEARCH DEALS API
  Future<void> fetchDealsWithSearch({int page = 1, String? searchTerm}) async {
    try {
      isLoading.value = true;

      final double lat = 23.7587992;
      final double lng = 90.4293804;

      final query = {
        "page": page,
        "limit": 10,
        "searchTerm": searchTerm,
      };

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/all_deals/$lng/$lat',
        queryParameters: query,
      );

      final Map<String, dynamic> res =
      response.data is String ? jsonDecode(response.data) : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];

        deals.value = items.map((e) => DealCardModel.fromJson(e)).toList();

        print("Search deals loaded: ${deals.length}");
      } else {
        deals.clear();
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