//
// import 'package:get/get.dart';
// import '../api_service/category_details_api_service.dart';
// import '../model/category_deal_model.dart';
//
// class CategoryDetailsController extends GetxController {
//
//   final CategoryDetailsApiService _api = CategoryDetailsApiService();
//
//   var deals = <CategoryDealModel>[].obs;
//   var isLoading = false.obs;
//
//   late String categoryId;
//   late String title;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     /// Receive arguments
//     final args = Get.arguments;
//
//     if (args != null) {
//       categoryId = args["id"] ?? "";
//       title = args["title"] ?? "";
//     }
//
//     fetchDeals();
//   }
//
//   Future<void> fetchDeals({String sort = "reguler_price"}) async {
//     try {
//
//       isLoading.value = true;
//
//       final result = await _api.getCategoryDeals(
//         categoryId,
//         sort: sort,
//       );
//
//       deals.assignAll(result);
//
//     } catch (e) {
//
//       print("Category Deals Error: $e");
//
//     } finally {
//
//       isLoading.value = false;
//
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
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

  /// Fetch deals for this category
  Future<void> fetchDeals({String sort = "reguler_price"}) async {
    try {
      isLoading.value = true;

      final result = await _api.getCategoryDeals(
        categoryId,
        sort: sort,
      );

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

  /// API call for search
  Future<void> fetchDealsWithSearch({int page = 1, String? searchTerm}) async {
    if (searchTerm == null || searchTerm.isEmpty) return;

    try {
      isLoading.value = true;

      final double lat = 90.4293804;
      final double lng = 23.7587992;

      final query = {"page": page, "limit": 10, "searchTerm": searchTerm};

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/all_deals/$lat/$lng',
        queryParameters: query,
      );

      final Map<String, dynamic> res = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']['deals'];

        // Map API result to CategoryDealModel
        deals.value = items
            .map((e) => CategoryDealModel.fromJson(e))
            .toList();

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