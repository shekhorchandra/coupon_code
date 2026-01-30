import 'dart:convert';

import 'package:coupon_code/app/data/mock_data/mock_deals.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class VendorDashboardController extends GetxController {
  var deals = <DealModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadDeals();
  }

  Future<void> loadDeals() async {
    try {
      isLoading(true);

      // Use compute to parse JSON string in an isolate
      final List<DealModel> loadedDeals = await compute(parseDealsIsolate, mockDeals);

      deals.assignAll(loadedDeals);
    } catch (e) {
      debugPrint("Error loading deals: $e");
    } finally {
      isLoading(false);
    }
  }

  static List<DealModel> parseDealsIsolate(String jsonStr) {
    final List<dynamic> data = jsonDecode(jsonStr);
    return data.map((e) => DealModel.fromMap(e as Map<String, dynamic>)).toList();
  }
}
