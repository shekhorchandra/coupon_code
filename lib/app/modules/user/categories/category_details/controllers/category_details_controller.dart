import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
import '../../../../services/geolocator_helper/current_location_picker.dart';
import '../api_service/category_details_api_service.dart';
import '../model/category_deal_model.dart';

class CategoryDetailsController extends GetxController {
  final CategoryDetailsApiService _api = CategoryDetailsApiService();

  var deals = <dynamic>[].obs;
  var isLoading = false.obs;
  RxString currentSearchTerm = "".obs;

  late String categoryId;
  late String title;
  final sortBy = "Price: Low to High".obs;

  final sortOptions = ["Price: Low to High", "Price: High to Low", "Distance", "Discount"];

  final searchController = TextEditingController();
  final zipController = TextEditingController();

  var currentTime = DateTime.now().obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    // Receive arguments
    final args = Get.arguments;
    if (args != null) {
      categoryId = args["id"] ?? "";
      title = args["title"] ?? "";
    }

    // Listen to search/zip fields to clear text automatically
    searchController.addListener(_handleSearchTextChange);
    zipController.addListener(_handleSearchTextChange);

    // Fetch initial deals
    fetchDeals();

    /// global timer (every second)
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });
  }

  void _handleSearchTextChange() {
    if (searchController.text.isEmpty && zipController.text.isEmpty) {
      currentSearchTerm.value = ""; // hide the text when fields are empty
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    searchController.removeListener(_handleSearchTextChange);
    zipController.removeListener(_handleSearchTextChange);
    super.onClose();
  }

  void applySorting() {
    final sorted = deals.toList();

    switch (sortBy.value) {
      case "Price: Low to High":
        sorted.sort((a, b) => a.finalPrice.compareTo(b.finalPrice));
        break;

      case "Price: High to Low":
        sorted.sort((a, b) => b.finalPrice.compareTo(a.finalPrice));
        break;

      case "Distance":
        sorted.sort((a, b) => a.distance.compareTo(b.distance));
        break;

      case "Discount":
        sorted.sort((a, b) => b.discount.compareTo(a.discount));
        break;
    }

    deals.assignAll(sorted);
  }

  /// for refresh
  Future<void> refreshDeals() async {
    currentSearchTerm.value = ""; // hide text
    searchController.clear();
    zipController.clear();
    await fetchDeals();
  }

  /// Fetch deals for this category
  Future<void> fetchDeals({String sort = "regular_price"}) async {
    try {
      isLoading.value = true;

      final result = await _api.getCategoryDeals(categoryId, sort: sort);

      deals.assignAll(result);

      applySorting();
    } catch (e) {
      print("Category Deals Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// SEARCH BUTTON CLICK
  void onSearchButton() {
    final keyword = searchController.text.trim();
    final zip = zipController.text.trim();

    String term = "";

    if (keyword.isNotEmpty) term = keyword;
    if (zip.isNotEmpty) term = zip;

    currentSearchTerm.value = term; // <-- show the text

    if (term.isEmpty) {
      fetchDeals(); // show default deals
    } else {
      fetchDealsWithSearch(searchTerm: term);
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

      final query = {"page": page, "limit": 1000, "searchTerm": searchTerm};

      final response = await Dio().get(
        '${ApiConstants.baseUrl}/service/deals/all_deals/$lng/$lat',
        queryParameters: query,
      );

      final Map<String, dynamic> res = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode == 200 && res['success'] == true) {
        final List items = res['data']?['deals'] ?? [];
        deals.value = items.map((e) => CategoryDealModel.fromJson(e)).toList();

        print("Deals loaded: ${deals.length}");
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
