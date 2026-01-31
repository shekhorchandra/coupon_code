import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/common_app_bar.dart';

import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();

    return Scaffold(
      appBar: CommonAppBar(
        title: "Contact Us",
        showBack: true,
        onBack: () {
          navController.closeOverlayPage(); // close overlay and return to previous bottom nav screen
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _paragraph(
              "We’d love to hear from you!\nWhether you have questions, need assistance, or want to share "
                  "feedback about “App Name”, we're here to help.",
            ),
            const SizedBox(height: 24),
            _sectionTitle("How to Reach Us: "),
            const SizedBox(height: 12),
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Email: "),
                  const SizedBox(height: 6),
                  Text(
                    "For general inquiries or support, email us at:-",
                    style: AppTextStyles.Text,
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => _launchUrl("mailto:support@appname.com"),
                    child: Text(
                      "support@appname.com",
                      style: AppTextStyles.Text.copyWith(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Phone:"),
                  const SizedBox(height: 6),
                  Text(
                    "Call us during business hours:-",
                    style: AppTextStyles.Text,
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => _launchUrl("tel:+1234567890"),
                    child: Text(
                      "+1 234 567 890",
                      style: AppTextStyles.Text.copyWith(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Monday to Friday: 9:00 AM – 6:00 PM (GMT)",
                    style: AppTextStyles.Text.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Mailing Address:"),
                  const SizedBox(height: 6),
                  Text(
                    "Your Company’s Mailing Address\nCity, State, ZIP Code",
                    style: AppTextStyles.Text,
                  ),
                ],
              ),
            ),
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Social Media"),
                  const SizedBox(height: 6),
                  _socialItem(icon: Icons.facebook, title: "Facebook", url: "https://facebook.com"),
                  _socialItem(icon: Icons.alternate_email, title: "Twitter", url: "https://twitter.com"),
                  _socialItem(icon: Icons.camera_alt, title: "Instagram", url: "https://instagram.com"),
                  _socialItem(icon: Icons.work, title: "LinkedIn", url: "https://linkedin.com"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  // ---------- Widgets ----------
  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: AppTextStyles.Text.copyWith(
          color: AppColor.textcolor, fontWeight: FontWeight.bold),
    );
  }

  Widget _paragraph(String text) {
    return Text(text, style: AppTextStyles.Text.copyWith());
  }

  Widget _socialItem({required IconData icon, required String title, required String url}) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, color: AppColor.primary),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.Text.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
