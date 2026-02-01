import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/modules/user/discover_bar/coupon_code/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../bottom_nav_bar/views/bottom_nav_view.dart';
import '../controllers/discover_details_controller.dart';

class ServiceDetailsPage extends StatelessWidget {
  ServiceDetailsPage({super.key});

  final controller = Get.put(ServiceDetailsController());

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    return Scaffold(
        appBar: CommonAppBar(
          title: "Deal Details",
          showBack: true,
          onBack: () {
            // Close the overlay page instead of default back
            navController.closeOverlayPage();
          },
        ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= IMAGE SLIDER =================
              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// IMAGE SLIDER
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.images.length,
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (_, index) {
                        return Image.asset(
                          controller.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),

                    /// LEFT ARROW
                    Positioned(
                      left: 12,
                      child: Obx(
                        () => IconButton(
                          onPressed: controller.currentImage.value == 0
                              ? null
                              : controller.previous,
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /// RIGHT ARROW
                    Positioned(
                      right: 12,
                      child: Obx(
                        () => IconButton(
                          onPressed:
                              controller.currentImage.value ==
                                  controller.images.length - 1
                              ? null
                              : controller.next,
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /// IMAGE COUNT
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Obx(
                            () => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${controller.currentImage.value + 1} / ${controller.images.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              // ================= TITLE =================
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "The Ultimate Radiance Revival: Luxurious Facial, Skin Rejuvenation, and Glowing Treatment Experience",
                  style: AppTextStyles.MenuTitle.copyWith(color: Colors.black),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.category, // or any salon/shop icon
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Glamour Glow Salon",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Address text
                    Expanded(
                      child: Text(
                        "1234 Streets, New York  ● 1.2 km away",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.MenuButtonText.copyWith(
                          color: AppColor.titleColor,
                        ),
                      ),
                    ),

                    //  Favorite
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {
                        // handle save / favorite
                      },
                    ),

                    // Share
                    IconButton(
                      icon: const Icon(Icons.share_outlined),
                      color: AppColor.titleColor,
                      onPressed: () {
                        // handle share
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "\$20",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "\$30",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary, // 🔴 background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "55% off",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white, // readable on red
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 34),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(
                          0.15,
                        ), // light orange background
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        "10d   08h   54m   23s",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange, // bold orange text
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ================= HIGHLIGHTS =================
              _section(
                title: "Highlights",
                child: const Text(
                  '''
The Ultimate Radiance Revival: Luxurious Facial, Skin Rejuvenation, and Glowing Treatment Experience

Treat your skin to a complete rejuvenation with our Ultimate Radiance Revival facial. Designed to nourish, hydrate, and revitalize, this luxurious facial treatment is perfect for anyone seeking a radiant glow.

• Luxurious Facial Treatment
• Skin Rejuvenation
• Radiant, Glowing Skin
• Exclusive 60-Minute Session
• Pampering & Refreshing Experience
• Ideal for All Skin Types
''',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5, // better spacing for readability
                    color: Colors.black,
                  ),
                ),
              ),

              // ================= DESCRIPTION =================
              _section(
                title: "Description",
                child: const Text(
                  '''
The Ultimate Radiance Revival: Luxurious Facial, Skin Rejuvenation, and Glowing Treatment Experience

Treat your skin to a complete rejuvenation with our Ultimate Radiance Revival facial. Designed to nourish, hydrate, and revitalize, this luxurious facial treatment is perfect for anyone seeking a radiant glow.

What’s Included:
• Deep Cleansing Facial – Remove impurities and toxins
• Exfoliation – Reveal smoother, fresher skin
• Custom Face Mask – Tailored to your skin needs
• Skin Rejuvenation Treatment – Nourishing serums & oils
• Facial Massage – Relaxation & circulation boost
• Glow Finish – Soft, hydrated, glowing skin

Ideal For:
• Dull, tired skin
• Special occasions
• Pampering self-care
• Suitable for all skin types

Duration: 60 minutes

Results You Can Expect:
• Radiant, glowing complexion
• Smoother skin texture
• Deep hydration & nourishment
• Total relaxation & rejuvenation
''',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5, // better spacing for readability
                    color: Colors.black,
                  ),
                ),
              ),

              // ================= HOW TO REDEEM =================
              _section(
                title: "How to Redeem",
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(
                    'assets/images/redeem.png', // replace with your infographic image
                    width: double.infinity, // take full width
                    fit: BoxFit
                        .contain, // or BoxFit.cover depending on your design
                  ),
                ),
              ),

              // ================= LOCATION =================
              // _section(
              //   title: "Location",
              //   child: SizedBox(
              //     height: 200,
              //     child: GoogleMap(
              //       initialCameraPosition: const CameraPosition(
              //         target: LatLng(23.8103, 90.4125),
              //         zoom: 14,
              //       ),
              //       markers: {
              //         const Marker(
              //           markerId: MarkerId("salon"),
              //           position: LatLng(23.8103, 90.4125),
              //           infoWindow: InfoWindow(title: "Glamour Glow Salon"),
              //         ),
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ================= BOTTOM BUTTONS =================
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Save For Later',
                    onPressed: () {},
                    backgroundColor: Colors.white70,
                    textColor: AppColor.primary,
                    borderColor: AppColor.primary,
                    leading: SvgPicture.asset(
                      AppAssets.saved,
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        AppColor.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),


                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(onPressed: () {
                    showCouponDemoPopup();
                  }, text: 'Show Coupon',),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= COMMON FOLDABLE SECTION =================
  static Widget _section({required String title, required Widget child}) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [child],
    );
  }
}
