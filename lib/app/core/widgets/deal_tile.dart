import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DealTile extends StatelessWidget {
  final DealModel deal;
  final int dealType;

  const DealTile({super.key, required this.deal, required this.dealType});

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
      onTap: () => Get.toNamed(AppRoutes.VENDOR_DEAL_DETAILS, arguments: {'dealItem': deal}),
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFFF6F7FD)),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: 'top-deals-grid-${deal.id}',
                child: CachedNetworkImage(
                  imageUrl: deal.media.first.imageUrl,
                  width: 100,
                  height: 100,
                  fit: .cover,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .max,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      // Title
                      Expanded(
                        child: Text(
                          deal.title,
                          maxLines: 2,
                          overflow: .ellipsis,
                          style: AppText.body2.semiBold.copyWith(color: AppColor.bw.s800),
                        ),
                      ),

                      // More options
                      PopupMenuButton<String>(
                        color: AppColor.cardBackground,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onSelected: (value) {
                          if (value == 'delete') {
                            debugPrint('Delete button pressed!');
                          }
                        },
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            value: dealType.toString(),
                            child: Row(
                              children: [
                                if (dealType == 0) ...[
                                  Icon(Iconsax.edit_2),
                                  const SizedBox(width: 10),
                                  Text('Edit', style: AppText.body2.medium),
                                ],

                                if (dealType == 1) ...[
                                  Icon(Iconsax.edit_2),
                                  const SizedBox(width: 10),
                                  Text('Re-activate', style: AppText.body2.medium),
                                ],
                              ],
                            ),
                          ),
                        ],
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.more_vert_rounded, size: 20),
                        ),
                      ),
                    ],
                  ),

                  // Company name
                  Row(
                    children: [
                      Icon(Iconsax.shop_copy, size: 16, color: AppColor.bw.s400),

                      const SizedBox(width: 5),

                      Text(
                        'Glamour Glow Salon',
                        style: AppText.body2.semiBold.copyWith(color: AppColor.bw.s400),
                      ),
                    ],
                  ),

                  // Pricing
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$${deal.afterDiscountPrice.toStringAsFixed(2)}",
                            style: AppText.label.bold.copyWith(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            "\$${deal.regularPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Countdown
                      FittedBox(
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      // Switcher
                      if (dealType == 0)
                        Switch.adaptive(value: deal.isActive, onChanged: (value) {}),
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
}
