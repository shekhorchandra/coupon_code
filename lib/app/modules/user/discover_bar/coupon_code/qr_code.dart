import 'dart:math';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showCouponDemoPopup({required String productId}) {
  final couponCode = _generateDemoCoupon();
  final selectedIndex = 0.obs; // 0 = Coupon, 1 = QR, 2 = Barcode

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// ---------------- Segmented Button ----------------
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    _segmentButton("Coupon", 0, selectedIndex),
                    _segmentButton("QR", 1, selectedIndex),
                    _segmentButton("Barcode", 2, selectedIndex),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ---------------- Dynamic Content ----------------
              if (selectedIndex.value == 0) _buildCouponCode(couponCode),

              if (selectedIndex.value == 1) QrImageView(data: "$productId|$couponCode", size: 220),

              if (selectedIndex.value == 2)
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: "$productId|$couponCode",
                  width: 250,
                  height: 90,
                ),

              const SizedBox(height: 20),

              /// Close Button
              AppButton(text: "Close", height: 42, onPressed: Get.back),
            ],
          ),
        ),
      ),
    ),
  );
}

/// ---------------- Segmented Button Widget ----------------
Widget _segmentButton(String title, int index, RxInt selectedIndex) {
  return Expanded(
    child: GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selectedIndex.value == index ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex.value == index ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

/// ---------------- Coupon Code UI ----------------
Widget _buildCouponCode(String couponCode) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColor.primary),
        ),
        child: Text(
          couponCode,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.4),
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        "Show this coupon at the merchant to redeem.",
        style: TextStyle(fontSize: 12, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

/// ---------------- Demo Coupon Generator ----------------
String _generateDemoCoupon() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ123456789';
  final rand = Random();

  return 'GLAM-' + List.generate(5, (_) => chars[rand.nextInt(chars.length)]).join();
}
