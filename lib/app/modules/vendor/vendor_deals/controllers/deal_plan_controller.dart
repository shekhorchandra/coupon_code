import 'dart:developer';
import 'dart:io';

import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/data/services/in_app_purchase_service.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class DealPlanController extends GetxController {
  final InAppPurchaseService iapService = InAppPurchaseService();

  var isStoreLoading = true.obs;
  var errorMessage = "".obs;
  var selectedProduct = Rxn<ProductDetails>();
  var isPurchasing = false.obs; // Track purchase in progress

  @override
  void onInit() {
    super.onInit();
    log("DealPlanController initialized");
    loadStore();

    // Listen for purchase verification events
    iapService.purchaseCallback = _onPurchaseResult;
  }

  @override
  void onReady() {
    super.onReady();
    log("DealPlanController ready");
    Future.delayed(const Duration(milliseconds: 500), () {
      showAlertDialog();
    });
  }

  void showAlertDialog() {
    log("Displaying publish warning dialog");

    Get.dialog(
      AlertDialog.adaptive(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_rounded, size: 80, color: AppColor.warning),
              const SizedBox(height: 10),
              const Text(
                "Your deal isn't live now. Pick a plan to publish it for everyone.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          Platform.isAndroid
              ? TextButton(
                  onPressed: () {
                    log("Dialog dismissed (Android)");
                    Get.back();
                  },
                  child: const Text("OK", style: TextStyle(color: AppColor.primary)),
                )
              : CupertinoButton(
                  onPressed: () {
                    log("Dialog dismissed (iOS)");
                    Get.back();
                  },
                  child: const Text("OK", style: TextStyle(color: AppColor.primary)),
                ),
        ],
      ),
    );
  }

  Future<void> loadStore() async {
    try {
      log("Loading store...");
      isStoreLoading.value = true;
      errorMessage.value = "";

      await iapService.init();

      if (iapService.products.isEmpty) {
        log("No products found");
        errorMessage.value = "No plans found.";
      } else {
        log("Products fetched: ${iapService.products.map((e) => e.id).toList()}");

        // Auto-select first product if none selected
        selectedProduct.value ??= iapService.products.first;
        log("Auto-selected product: ${selectedProduct.value?.id}");
      }
    } catch (e) {
      log("Error loading store: $e");
      errorMessage.value = "Error loading store: $e";
    } finally {
      isStoreLoading.value = false;
      log("Store loading finished");
    }
  }

  void handlePublish(String dealId) {
    log("Publish button clicked with dealId: $dealId");

    if (isPurchasing.value) {
      log("Purchase already in progress, blocking new request");
      return;
    }

    if (selectedProduct.value == null) {
      log("No product selected");
      Get.snackbar('Error', 'Please select a plan');
      return;
    }

    log("Initiating purchase for product: ${selectedProduct.value!.id}");
    isPurchasing.value = true;

    // Start purchase
    iapService.buy(selectedProduct.value!, dealId);
  }

  // Callback from InAppPurchaseService after verification
  void _onPurchaseResult(bool success) {
    log("Purchase verification result: $success");
    isPurchasing.value = false;

    if (success) {
      log("Navigating to purchase success page");
      Get.offAllNamed(AppRoutes.DEAL_PLAN_PURCHASE_SUCCESS);
    } else {
      log("Purchase verification failed");
      Get.snackbar("Error", "Could not complete your purchase. Try again.");
    }
  }

  Color getPlanColor(String id) {
    log("Getting color for plan: $id");
    if (id.contains('7d')) return const Color(0xFFF6741C);
    if (id.contains('14d')) return const Color(0xFF2F6ED8);
    return const Color(0xFF63A043);
  }
}
