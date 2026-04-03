import 'dart:io';

import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/data/services/in_app_purchase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class DealPlanController extends GetxController {
  final InAppPurchaseService iapService = InAppPurchaseService();

  var isStoreLoading = true.obs;
  var errorMessage = "".obs;
  var selectedProduct = Rxn<ProductDetails>();

  @override
  void onInit() {
    super.onInit();
    loadStore();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () {
      showAlertDialog();
    });
  }

  void showAlertDialog() {
    Get.dialog(
      AlertDialog.adaptive(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: .min,
            children: [
              Icon(Icons.warning_rounded, size: 80, color: AppColor.warning),
              const SizedBox(height: 10),
              const Text(
                "Your deal isn\'t live now. Pick a plan to publish it for everyone.",
                textAlign: .center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          Platform.isAndroid
              ? TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("OK", style: TextStyle(color: AppColor.primary)),
                )
              : CupertinoButton(
                  onPressed: () => Get.back(),
                  child: const Text("OK", style: TextStyle(color: AppColor.primary)),
                ),
        ],
      ),
    );
  }

  Future<void> loadStore() async {
    try {
      isStoreLoading.value = true;
      errorMessage.value = "";

      await iapService.init();

      if (!iapService.available) {
        errorMessage.value = "Store not available.";
        return;
      }

      if (iapService.products.isEmpty) {
        errorMessage.value = "No plans found.";
      } else {
        // Automatically select the first plan if none selected
        if (selectedProduct.value == null && iapService.products.isNotEmpty) {
          selectedProduct.value = iapService.products.first;
        }
      }
    } catch (e) {
      errorMessage.value = "Error loading store: $e";
    } finally {
      isStoreLoading.value = false;
    }
  }

  void handlePublish(String dealId) {
    if (iapService.isProcessing.value) return;

    if (selectedProduct.value == null) {
      Get.snackbar('Error', 'Please select a plan');
      return;
    }
    iapService.buy(selectedProduct.value!, dealId);
  }

  void restorePurchases() => iapService.restorePurchases();

  Color getPlanColor(String id) {
    if (id.contains('7d')) return const Color(0xFFF6741C);
    if (id.contains('14d')) return const Color(0xFF2F6ED8);
    return const Color(0xFF63A043);
  }
}
