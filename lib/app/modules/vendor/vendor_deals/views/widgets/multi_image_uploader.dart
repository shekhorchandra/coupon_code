import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiImageUploader extends StatelessWidget {
  const MultiImageUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VendorDealsController>();

    return Obx(() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: controller.images.isEmpty
            ? _buildPlaceholder(controller)
            : Stack(
                children: [
                  // Image Slider
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) => controller.currentImageIndex.value = index,
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          controller.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),

                  // Gradient Overlay
                  const Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black26,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black26,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Delete Button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => controller.removeImage(controller.currentImageIndex.value),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.delete_outline, size: 20, color: AppColor.error),
                      ),
                    ),
                  ),

                  // Arrow Keys
                  if (controller.images.length > 1) ...[
                    _buildArrow(
                      alignment: Alignment.centerLeft,
                      icon: Icons.arrow_back_ios_new,
                      onTap: controller.previousImage,
                      visible: controller.currentImageIndex.value > 0,
                    ),
                    _buildArrow(
                      alignment: Alignment.centerRight,
                      icon: Icons.arrow_forward_ios,
                      onTap: controller.nextImage,
                      visible: controller.currentImageIndex.value < controller.images.length - 1,
                    ),
                  ],

                  // Counter
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(150),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${controller.currentImageIndex.value + 1}/${controller.images.length}",
                        style: AppText.body2.bold.copyWith(color: AppColor.white),
                      ),
                    ),
                  ),

                  // Add Button
                  if (controller.images.length < 6)
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.white70,
                        onPressed: controller.pickImage,
                        child: const Icon(Icons.add_a_photo, color: Colors.black54),
                      ),
                    ),
                ],
              ),
      );
    });
  }

  Widget _buildPlaceholder(VendorDealsController controller) {
    return InkWell(
      onTap: controller.pickImage,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.bw.s300,
            child: Icon(Icons.add_rounded, size: 40, color: AppColor.bw.s100),
          ),
          SizedBox(height: 8),
          Text("Upload Images (Max 6)", style: TextStyle(color: AppColor.bw.s300)),
        ],
      ),
    );
  }

  Widget _buildArrow({
    required Alignment alignment,
    required IconData icon,
    required VoidCallback onTap,
    required bool visible,
  }) {
    return Visibility(
      visible: visible,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white.withAlpha(120), shape: BoxShape.circle),
              child: Icon(icon, size: 18, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
