import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
import '../../../../services/geolocator_helper/current_location_picker.dart';
import '../models/deal_card_model.dart';

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

  /// search for zip code
  void onZipPressed() {
    final zip = searchQuery.value.trim();

    if (zip.isNotEmpty) {
      fetchDealsWithSearch(searchTerm: zip);
    }
  }

  void onLocationPressed() {}
  void onNotificationPressed() {}

  /// for refresh
  Future<void> refreshDeals() async {
    await fetchDeals();
  }

  /// fetach all deals
  Future<void> fetchDeals({int page = 1}) async {
    try {
      isLoading.value = true;

      final position = await getCurrentLocation();
      if (position == null) {
        deals.clear();
        print("Could not get current location");
        return;
      }

      final lng = position.longitude;
      final lat = position.latitude;

      print("Location: lat=$lat, lng=$lng");

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/$lng/$lat',
        queryParameters: {"page": page, "limit": 10},
      );

      final res = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];
        deals.value = items.map((e) => DealCardModel.fromJson(e)).toList();
        print("Deals loaded: ${deals.length}");
      } else {
        deals.clear();
      }
    } catch (e) {
      if (e is DioException) {
        print("Status: ${e.response?.statusCode}");
        print("Response: ${e.response?.data}");
      } else {
        print("Error: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// SEARCH DEALS API
  Future<void> fetchDealsWithSearch({int page = 1, String? searchTerm}) async {
    if (searchTerm == null || searchTerm.isEmpty) return; // don't call if empty

    try {
      isLoading.value = true;

      final position = await getCurrentLocation();
      if (position == null) {
        print("Could not get current location");
        return;
      }

      final double lng = position.longitude;
      final double lat = position.latitude;

      final query = {"page": page, "limit": 10, "searchTerm": searchTerm};

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/all_deals/$lng/$lat',
        queryParameters: query,
      );

      final Map<String, dynamic> res = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];
        deals.value = items.map((e) => DealCardModel.fromJson(e)).toList();
        print("Search deals loaded: ${deals.length}");
      } else {
        deals.clear();
        final msg = HttpStatusHandler.getMessage(
          response.statusCode ?? 0,
          fallback: res['message']?.toString(),
        );
        print("Failed: $msg");
      }
    } catch (e) {
      if (e is DioException) {
        final msg = HttpStatusHandler.getMessage(
          e.response?.statusCode ?? 0,
          fallback: e.response?.data?['message']?.toString(),
        );
        print("Dio error: $msg");
      } else {
        print("Error: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }

}
