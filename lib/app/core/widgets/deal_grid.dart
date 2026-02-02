import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealGrid extends StatelessWidget {
  const DealGrid({super.key, required this.deal});

  final DealModel deal;

  String formatRemainingTime(DateTime expiryDate) {
    final now = DateTime.now();
    if (expiryDate.isBefore(now)) return "Expired";

    final duration = expiryDate.difference(now);
    final days = duration.inDays;
    final hours = duration.inHours % 24;

    return "${days}d ${hours}h";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.DISCOVERDETAILS, arguments: {'id': deal.id}),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF6F7FD),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE SECTION
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: deal.media.isNotEmpty
                        ? Hero(
                            tag: 'top-deals-grid-${deal.id}',
                            child: CachedNetworkImage(
                              imageUrl: deal.media.first.imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(color: Colors.grey[200]),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          )
                        : Container(color: Colors.grey[200]),
                  ),
                ),
                Positioned(top: 8, left: 8, child: _badge(deal.views?.toString() ?? "0")),
              ],
            ),

            // CONTENT SECTION
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.label.bold.copyWith(color: AppColor.bw.s800, fontSize: 13),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price Info
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${deal.afterDiscountPrice}",
                              style: AppText.label.bold.copyWith(fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              "\$${deal.regularPrice}",
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Timer Badge
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF1E5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            child: Text(
                              formatRemainingTime(deal.expireDate),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.remove_red_eye_outlined, size: 13, color: AppColor.bw.s500),
          const SizedBox(width: 4),
          Text(text, style: AppText.label.semiBold.copyWith(fontSize: 11, color: AppColor.bw.s500)),
        ],
      ),
    );
  }
}
