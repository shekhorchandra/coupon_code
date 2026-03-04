// lib/app/modules/deals/views/widgets/deal_card.dart
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/values/app_assets.dart';
import '../../../../../../core/widgets/App_button.dart';
import '../deal_badge.dart';
import '../deal_card_model.dart';
import '../deal_overlay_text.dart';


class DealCard extends StatelessWidget {
  final DealCardModel deal;
  final int index;

  const DealCard({super.key, required this.deal, required this.index});

  // Calculate time left for promotion
  String getTimeLeft(DateTime? promotedUntil) {
    if (promotedUntil == null) return "";
    final now = DateTime.now();
    if (promotedUntil.isBefore(now)) return "Expired";

    final difference = promotedUntil.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "${days}d ${hours}h";
  }

  @override
  Widget build(BuildContext context) {
    final isShort = index % 2 == 0;
    final imageUrl = deal.images.isNotEmpty
        ? deal.images.first
        : 'https://picsum.photos/300';

    final priceAfterDiscount =
    DealCardModel.afterDiscountPrice(deal.regularPrice, deal.discountPercent);

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
              // Deal Image
              Container(
                height: isShort ? 155 : 255,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Distance Badge
              Positioned(
                top: 8,
                left: 8,
                child: dealBadge(
                    "${(deal.distance / 1000).toStringAsFixed(1)} km"), // meters to km
              ),
              // Discount Badge
              Positioned(
                bottom: 8,
                right: 8,
                child: dealOverlayText("${deal.discountPercent.toInt()}% off"),
              ),
            ],
          ),
          // Deal Info
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  deal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Shop Name with icon
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.category,
                      width: 14,
                      height: 14,
                      colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/shop-details', arguments: {'shopId': deal.shopId});
                      },
                      child: Text(
                        deal.shopName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue, // make it look clickable
                          decoration: TextDecoration.underline, // optional
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Price & Time Left
                Row(
                  children: [
                    Text(
                      "\$${priceAfterDiscount.toStringAsFixed(1)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$${deal.regularPrice.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      getTimeLeft(deal.promotedUntil),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Redeem Button
                AppButton(
                  text: "Redeem Now",
                  height: 32,
                  onPressed: () => Get.toNamed('/discover-details',
                      arguments: {'id': deal.id}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}