import 'package:barcode_widget/barcode_widget.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Controller/coupon_controller.dart';


class CouponPopupView extends GetView<CouponController> {
  const CouponPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// 🔹 Segmented Tabs
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _segmentButton("Coupon", 0),
                  _segmentButton("QR", 1),
                  _segmentButton("Barcode", 2),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Dynamic Content
            if (controller.selectedIndex.value == 0)
              _buildCouponCode(controller.couponCode),

            if (controller.selectedIndex.value == 1)
              QrImageView(
                data: controller.qrData,
                size: 220,
              ),

            if (controller.selectedIndex.value == 2)
              BarcodeWidget(
                barcode: Barcode.code128(),
                data: controller.qrData,
                width: 250,
                height: 90,
              ),

            const SizedBox(height: 20),

            AppButton(
              text: "Close",
              height: 42,
              onPressed: Get.back,
            ),
          ],
        )),
      ),
    );
  }

  /// 🔹 Segmented Button
  Widget _segmentButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? AppColor.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Coupon UI
  Widget _buildCouponCode(String code) {
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
            code,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
            ),
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
}