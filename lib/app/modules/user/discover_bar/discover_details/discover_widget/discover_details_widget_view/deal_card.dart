import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/values/app_assets.dart';
import '../../../../../../core/widgets/App_button.dart';
import '../deal_badge.dart';
import '../deal_overlay_text.dart';

class DealCard extends StatelessWidget {
  final int index;

  const DealCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final isShort = index % 2 == 0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: isShort ? 155 : 255,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(top: 8, left: 8, child: dealBadge("55% off")),
              Positioned(bottom: 8, right: 8, child: dealOverlayText("● 1.2 km away")),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "The Ultimate Radiance Revival...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.category, // or any salon/shop icon
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Glamour Glow Salon",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: const [
                    Text("\$20", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 6),
                    Text(
                      "\$30",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 24),

                    Text(
                      "10d   08h",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                AppButton(
                  text: "Redeem Now",
                  height: 32,
                  onPressed: () => Get.toNamed(
                    AppRoutes.DISCOVERDETAILS,
                    arguments: {'id': '69a2f0d7e6bc98e5f88b7dad'},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
