import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDealsController extends GetxController {
  final DioClient _dioClient = DioClient();

  // 📦 Deals list
  RxList<DealModel> deals = <DealModel>[].obs;

  // 🔢 Pagination
  RxInt page = 1.obs;
  RxInt totalPages = 1.obs;

  // 🔄 Loading states
  RxBool isLoading = false.obs; // first load
  RxBool isLoadMore = false.obs; // pagination load

  // 🧭 Tabs
  RxInt selectedTab = 0.obs;

  // 📜 Scroll Controller
  final ScrollController scrollController = ScrollController();

  // 🚀 INIT
  @override
  void onInit() {
    super.onInit();

    fetchDeals(isInitial: true);

    scrollController.addListener(_scrollListener);
  }

  // 🔄 Scroll Listener for Pagination
  void _scrollListener() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      loadMore();
    }
  }

  // 🎯 Change Tab
  void setTab(int index) async {
    if (selectedTab.value == index) return;

    selectedTab.value = index;

    // Reset pagination
    page.value = 1;
    totalPages.value = 1;
    deals.clear();

    await fetchDeals(isInitial: true);
  }

  // 📡 Fetch Deals API
  Future<void> fetchDeals({bool isInitial = false}) async {
    if (isInitial) {
      isLoading.value = true;
    } else {
      isLoadMore.value = true;
    }

    try {
      final response = await _dioClient.client.get(
        ApiConstants.myDeals,
        queryParameters: {'page': page.value, 'limit': 10000, 'deal_filter': _getFilter()},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];

        // 📊 Meta
        totalPages.value = data['meta']['totalPages'];

        // 📦 Deals parsing
        List<DealModel> newDeals = (data['deals'] as List)
            .map((e) => DealModel.fromMap(e))
            .toList();

        if (page.value == 1) {
          deals.value = newDeals;
        } else {
          deals.addAll(newDeals);
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load deals');
    } finally {
      isLoading.value = false;
      isLoadMore.value = false;
    }
  }

  // ➕ Load More
  void loadMore() {
    if (page.value < totalPages.value && !isLoadMore.value) {
      page.value++;
      fetchDeals();
    }
  }

  // 🔍 Filter based on tab
  String _getFilter() {
    switch (selectedTab.value) {
      case 0:
        return 'promoted';
      case 1:
        return 'expired';
      case 2:
        return 'new';
      default:
        return '';
    }
  }

  // 🔄 Pull to refresh
  Future<void> refreshDeals() async {
    page.value = 1;
    deals.clear();
    await fetchDeals(isInitial: true);
  }

  // 🧹 Dispose
  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
