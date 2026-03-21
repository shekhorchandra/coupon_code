import 'package:cached_network_image/cached_network_image.dart';
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
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.bw.s300.withOpacity(0.5)),
        ),
        child: controller.images.isEmpty
            ? _buildPlaceholder(controller)
            : Stack(
                children: [
                  // Image Slider (Supports File and Network)
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) => controller.currentImageIndex.value = index,
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      final item = controller.images[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: item.isNetwork
                            ? CachedNetworkImage(
                                imageUrl: item.url!,
                                fit: .cover,
                                width: double.infinity,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.broken_image, size: 60),
                              )
                            : Image.file(item.file!, fit: BoxFit.cover, width: double.infinity),
                      );
                    },
                  ),

                  // GestureDetector(
                  //   onTap: () => controller.setThumbnail(controller.currentImageIndex.value),
                  //   child: Icon(
                  //     controller.images[controller.currentImageIndex.value].isThumbnail
                  //         ? Icons.star
                  //         : Icons.star_border,
                  //     color: Colors.yellow,
                  //   ),
                  // ),

                  // Gradient Overlay
                  _buildGradient(),

                  // Thumbnail Badge (Indicator)
                  if (controller.images[controller.currentImageIndex.value].isThumbnail)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.white, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              "THUMBNAIL",
                              style: AppText.body2.bold.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Actions (Delete & Set Thumbnail)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Column(
                      children: [
                        // Delete Button
                        _buildActionButton(
                          icon: Icons.delete_outline,
                          color: AppColor.error,
                          onTap: () => controller.removeImage(controller.currentImageIndex.value),
                        ),
                        const SizedBox(height: 10),

                        // Set Thumbnail Button
                        _buildActionButton(
                          icon: controller.images[controller.currentImageIndex.value].isThumbnail
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          onTap: () => controller.setThumbnail(controller.currentImageIndex.value),
                        ),
                      ],
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

                  // Counter & Add Button Row
                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.images.length < 2)
                          FloatingActionButton.small(
                            heroTag: "add_img",
                            backgroundColor: Colors.white,
                            onPressed: controller.pickImage,
                            child: const Icon(Icons.add_a_photo, color: Colors.black87),
                          )
                        else
                          const SizedBox.shrink(),

                        Container(
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
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: color),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.transparent,
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
    );
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
          Text("Upload Images (Max 2)", style: TextStyle(color: AppColor.bw.s300)),
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
