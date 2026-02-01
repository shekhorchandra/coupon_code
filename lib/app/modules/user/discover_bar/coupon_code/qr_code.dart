import 'dart:math';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showCouponDemoPopup() {
  final couponCode = _generateDemoCoupon();

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // /// Title
            // const Text(
            //   "Your Coupon",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            //
            // const SizedBox(height: 16),



            /// QR Code
            QrImageView(
              data: couponCode, // demo only
              size: 260,
            ),

            const SizedBox(height: 12),

            /// Vendor hint
            const Text(
              "You can either scan the QR code or provide the coupon code at the merchant to redeem your deal.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            /// Coupon Code Box
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColor.primary),
              ),
              child: Text(
                couponCode,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Close button
            AppButton(
              text: "Close",
              height: 42,
              onPressed: Get.back,
            ),
          ],
        ),
      ),
    ),
  );
}

String _generateDemoCoupon() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ123456789';
  final rand = Random();

  return 'GLAM-' +
      List.generate(5, (_) => chars[rand.nextInt(chars.length)]).join();
}

