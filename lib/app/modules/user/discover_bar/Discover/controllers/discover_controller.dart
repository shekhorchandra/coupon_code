import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
import '../../../../services/geolocator_helper/current_location_picker.dart';
import '../models/deal_card_model.dart';

class DiscoverController extends GetxController {
  final searchQuery = ''.obs;
  final deals = <DealCardModel>[].obs;
  final isLoading = false.obs;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  RxString currentSearchTerm = "".obs;
  @override
  void onInit() {
    super.onInit();

    fetchDeals();

    // Hide "Showing results for..." when search field changes
    searchController.addListener(() {
      if (searchController.text.isEmpty && zipController.text.isEmpty) {
        currentSearchTerm.value = ""; // hide the text
      }
    });

    zipController.addListener(() {
      if (searchController.text.isEmpty && zipController.text.isEmpty) {
        currentSearchTerm.value = ""; // hide the text
      }
    });
  }

  void onSearchButton() {
    final keyword = searchController.text.trim();
    final zip = zipController.text.trim();

    String term = "";

    if (keyword.isNotEmpty) {
      term = keyword;
    }

    if (zip.isNotEmpty) {
      term = zip;
    }

    currentSearchTerm.value = term;

    if (term.isEmpty) {
      fetchDeals();
    } else {
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
    currentSearchTerm.value = "";
    searchController.clear();
    zipController.clear();
    await fetchDeals();
  }

  Future<void> fetchDeals({int page = 1}) async {
    try {
      isLoading.value = true;

      final position = await getCurrentLocation();
      if (position == null) {
        deals.clear();
        return;
      }

      final lng = position.longitude;
      final lat = position.latitude;

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
      } else {
        deals.clear();
      }
    } catch (e) {
      deals.clear();
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDealsWithSearch({int page = 1, String? searchTerm}) async {
    if (searchTerm == null || searchTerm.isEmpty) return;

    try {
      isLoading.value = true;

      final position = await getCurrentLocation();
      if (position == null) return;

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
        final List items = res['data']?['deals'] ?? [];
        deals.value = items.map((e) => DealCardModel.fromJson(e)).toList();
      } else {
        deals.clear();
      }
    } catch (e) {
      deals.clear();
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

