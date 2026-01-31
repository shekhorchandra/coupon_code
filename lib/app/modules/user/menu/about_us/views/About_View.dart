import 'package:coupon_code/app/modules/user/menu/about_us/controllers/About_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../bottom_nav_bar/views/bottom_nav_view.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    return Scaffold(
      appBar: CommonAppBar(
        title: "About Us",
        showBack: true,
        onBack: () {
          // Close the overlay page instead of default back
          navController.closeOverlayPage();
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _paragraph(
                "Welcome to App Name, your go-to platform for discovering the best local deals, exclusive offers, and exciting experiences! Our mission is to bring you the best discounts and unique opportunities, tailored specifically to your interests and location.",
              ),

              _paragraph(
                "At App Name, we believe that saving money should be simple and rewarding. Whether you're looking for a delicious meal at your favorite restaurant, a relaxing spa day, or an adventure-packed experience, we've got you covered. Our platform is designed to help you find the best deals near you with just a few clicks.",
              ),

              _section("Our Vision"),
              _paragraph(
                "To revolutionize how people discover_bar and enjoy local deals, by providing an intuitive, user-friendly platform that connects consumers with businesses offering valuable experiences and services.",
              ),

              _section("What We Offer"),
              _bullet(
                "Exclusive Deals",
                "Save on dining, wellness, fitness, and entertainment with exclusive offers from top-rated merchants.",
              ),
              _bullet(
                "Personalized Recommendations",
                "Browse curated deals based on your preferences and location.",
              ),
              _bullet(
                "Seamless Redemption",
                "Redeem deals with ease through QR codes or manual codes at participating merchants.",
              ),
              _bullet(
                "Loyalty & Rewards",
                "Enjoy our loyalty program and earn rewards for every deal you redeem.",
              ),

              _section("Our Promise"),
              _paragraph(
                "At App Name, we are committed to providing a seamless experience, where discovering great deals is easy and rewarding. We work closely with local businesses to bring you the best offers, ensuring that every deal on our platform is a valuable opportunity to save and enjoy.",
              ),

              _paragraph(
                "Thank you for choosing App Name. We are excited to help you discover_bar, redeem, and enjoy the best local deals near you.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- UI Helpers ----------

  Widget _section(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppTextStyles.Title.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _paragraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: AppTextStyles.Text,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _bullet(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•", style: TextStyle(fontSize: 18, height: 0.7)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$title: ",
                style: AppTextStyles.Text.copyWith(),
                children: [TextSpan(text: desc, style: AppTextStyles.Text)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
