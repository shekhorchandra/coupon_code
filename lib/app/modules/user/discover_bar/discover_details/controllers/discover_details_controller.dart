import 'dart:developer';

import 'package:coupon_code/app/data/models/deal_model_dto.dart';
import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  final PageController pageController = PageController();
  final DioClient _dioClient = DioClient();

  RxInt currentImage = 0.obs;
  Rxn<DealModelDTO> deal = Rxn<DealModelDTO>();
  Rxn<ShopModel> shop = Rxn<ShopModel>();

  void onPageChanged(int index) {
    currentImage.value = index;
  }

  void next() {
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void previous() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Single deal details
  Future<void> getDealDetails(String id) async {
    try {
      final response = await _dioClient.client.get(ApiConstants.dealDetails(id));

      if (response.statusCode == 200) {
        deal.value = DealModelDTO.fromMap(response.data['data']);
      } else {
        Get.snackbar('Error', 'Deal not found!');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Shop details
  Future<void> getShopDetails(String id) async {
    try {
      final response = await _dioClient.client.get(
        ApiConstants.shopDetails,
        queryParameters: {'shopId': id},
      );

      if (response.statusCode == 201) {
        shop.value = ShopModel.fromJson(response.data['data'][0]);
      } else {
        Get.snackbar('Error', 'Shop not found!');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
