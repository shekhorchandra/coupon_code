import 'dart:developer';

import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  final PageController pageController = PageController();
  final DioClient _dioClient = DioClient();

  RxInt currentImage = 0.obs;
  Rxn<DealModel> deal = Rxn<DealModel>();
  Rxn<ShopModel> shop = Rxn<ShopModel>();

  void onPageChanged(int index) => currentImage.value = index;

  void next() =>
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

  void previous() => pageController.previousPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );


  // Get Deal Details
  Future<void> getDealDetails(String id, {required double lat, required double lng}) async {
    try {
      final endpoint = "${ApiConstants.baseUrl}/service/$id/$lng/$lat";

      final response = await _dioClient.client.get(endpoint);

      if (response.statusCode == 200 && response.data['data'] != null) {
        deal.value = DealModel.fromMap(response.data['data']);

        // After fetching deal, fetch shop info
        if (deal.value!.shopId!.isNotEmpty) {
          await getShopDetails(deal.value!.shopId!);
        }
      } else {
        Get.snackbar('Error', 'Deal not found!');
      }
    } catch (e, stackTrace) {
      log("Error fetching deal details: $e", stackTrace: stackTrace);
      Get.snackbar('Error', 'Failed to fetch deal details');
    }
  }

  // Get Shop Details
  Future<void> getShopDetails(String shopId) async {
    try {
      final url = "${ApiConstants.baseUrl}/shop/shop_details?shopId=$shopId";
      final response = await _dioClient.client.get(url);

      if (response.statusCode == 200 && response.data['data'] != null) {
        shop.value = ShopModel.fromJson(response.data['data']);
      } else {
        Get.snackbar('Error', 'Shop not found!');
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.statusCode} - ${e.message}");
    } catch (e, st) {
      print("Unknown error: $e");
      print(st);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
