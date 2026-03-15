import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
import '../../../../services/geolocator_helper/current_location_picker.dart';
import '../api_service/category_details_api_service.dart';
import '../model/category_deal_model.dart';

class CategoryDetailsController extends GetxController {
  final CategoryDetailsApiService _api = CategoryDetailsApiService();

  var deals = <CategoryDealModel>[].obs;
  var isLoading = false.obs;

  late String categoryId;
  late String title;

  /// Debounce timer for search
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();

    // Receive arguments
    final args = Get.arguments;
    if (args != null) {
      categoryId = args["id"] ?? "";
      title = args["title"] ?? "";
    }

    // Fetch category deals initially
    fetchDeals();
  }

  /// for refresh
  Future<void> refreshDeals() async {
    await fetchDeals();
  }

  /// Fetch deals for this category
  Future<void> fetchDeals({String sort = "reguler_price"}) async {
    try {
      isLoading.value = true;

      final result = await _api.getCategoryDeals(categoryId, sort: sort);

      deals.assignAll(result);
    } catch (e) {
      print("Category Deals Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Search deals dynamically with debounce
  void onSearchDeals(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchDealsWithSearch(searchTerm: value);
    });
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
        deals.value = items.map((e) => CategoryDealModel.fromJson(e)).toList();
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
