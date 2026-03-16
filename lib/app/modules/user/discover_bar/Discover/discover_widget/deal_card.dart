
import 'dart:developer';

import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../data/models/deal_model.dart';
import '../../../../../data/services/storage_service.dart';
import 'deal_badge.dart';
import '../models/deal_card_model.dart';
import 'deal_overlay_text.dart';


class DealCard extends StatelessWidget {
  final DealCardModel deal;
  final int index;

  DealCard({super.key, required this.deal, required this.index});

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
        : ' ';

    final priceAfterDiscount =
    DealCardModel.afterDiscountPrice(deal.regularPrice, deal.discountPercent);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image with overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: isShort ? 160 : 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Skeleton(
                      height: 200,
                      width: double.infinity,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: isShort ? 160 : 260,
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                  ),
                ),
              ),

              /// Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black45],
                    ),
                  ),
                ),
              ),

              /// Distance badge (top-left)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${(deal.distance / 1000).toStringAsFixed(2)} km away",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),

              /// Discount badge (bottom-right)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${deal.discountPercent.toInt()}% OFF",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          /// Deal Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  deal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),

                /// Shop Name
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.shopDetails,
                      arguments: {"shopId": deal.shopId},
                    );
                  },
                  child: Text(
                    deal.shopName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                /// Price + Original Price + Time Left
                Row(
                  children: [
                    Text(
                      "\$${priceAfterDiscount.toStringAsFixed(1)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    const Spacer(),
                    if (deal.promotedUntil != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          getTimeLeft(deal.promotedUntil),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Redeem Button
                AppButton(
                  text: "Redeem Now",
                  height: 36,
                  width: double.infinity,
                  onPressed: () {
                    Get.toNamed('/discover-details', arguments: {'id': deal.id});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}