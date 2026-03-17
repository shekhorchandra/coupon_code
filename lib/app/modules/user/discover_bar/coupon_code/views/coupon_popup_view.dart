import 'package:barcode_widget/barcode_widget.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Controller/coupon_controller.dart';

class CouponPopupView extends GetView<CouponController> {
  const CouponPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = MediaQuery.of(context).size.height * .85;

          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (controller.couponCode.value.isEmpty) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: Text("No coupon available")),
                    );
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// IMAGE + TITLE
                      if (controller.dealTitle != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: controller.dealImage != null
                              ? Image.network(
                            controller.dealImage!,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .22,
                            fit: BoxFit.cover,
                          )
                              : const Icon(Icons.image_not_supported, size: 80),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          controller.dealTitle!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.titleColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        if (controller.regularPrice != null && controller.discountPercent != null)
                          Column(
                            children: [
                              _priceRow(
                                title: "Price",
                                value: "\$${controller.discountedPrice.toStringAsFixed(0)}",
                                valueColor: AppColor.primary,
                                isBold: true,
                              ),
                              _priceRow(
                                title: "Regular",
                                value: "\$${controller.regularPrice!.toStringAsFixed(0)}",
                                isStrike: true,
                              ),
                              _priceRow(
                                title: "Discount",
                                value: "${controller.discountPercent!.toStringAsFixed(0)}% OFF",
                                valueColor: Colors.green,
                                isBold: true,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "You save \$${(controller.regularPrice! - controller.discountedPrice).toStringAsFixed(0)}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              ),
                            ],
                          ),
                      ],

                      const SizedBox(height: 16),

                      /// TABS
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

                      /// DYNAMIC CONTENT
                      if (controller.selectedIndex.value == 0)
                        _buildCouponCode(controller.couponCode.value),

                      // QR Tab
                      if (controller.selectedIndex.value == 1)
                        Column(
                          children: [
                            controller.qrImage.value.isNotEmpty
                                ? Image.network(
                              controller.qrImage.value,
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.6,
                              fit: BoxFit.contain,
                            )
                                : QrImageView(
                              data: controller.qrData,
                              size: MediaQuery.of(context).size.width * 0.5,
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   controller.qrData,
                            //   style: const TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //     letterSpacing: 2,
                            //   ),
                            // ),
                          ],
                        ),

// Barcode Tab
                      if (controller.selectedIndex.value == 2)
                        Column(
                          children: [
                            controller.barcodeImage.value.isNotEmpty
                                ? Image.network(
                              controller.barcodeImage.value,
                              width: 280,
                              height: 100,
                              fit: BoxFit.contain,
                            )
                                : BarcodeWidget(
                              barcode: Barcode.code128(),
                              data: controller.qrData,
                              width: 280,
                              height: 200,
                              drawText: false,
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            //   controller.qrData,
                            //   style: const TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //     letterSpacing: 2,
                            //   ),
                            // ),
                          ],
                        ),
                      const SizedBox(height: 20),

                      /// CLOSE BUTTON (always at bottom)
                      AppButton(
                        text: "Close",
                        height: 42,
                        onPressed: Get.back,
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  ///  Segmented Button
  Widget _segmentButton(String title, int index) {
    final isSelected = controller.selectedIndex.value == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }

  ///  Coupon UI
  Widget _buildCouponCode(String code) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: AppColor.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.primary),
          ),
          child: Column(
            children: [
              /// Coupon Code
              Text(
                code,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 10),

              /// Copy Button
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: code));
                  Get.snackbar("Copied", "Coupon code copied");
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.copy, size: 16, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        "Copy",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        const Text(
          "Show this coupon at the merchant to redeem.",
          style: TextStyle(fontSize: 12, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _priceRow({
    required String title,
    required String value,
    Color valueColor = Colors.black,
    bool isBold = false,
    bool isStrike = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title:", style: const TextStyle(fontSize: 13, color: Colors.black)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
              decoration: isStrike ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
