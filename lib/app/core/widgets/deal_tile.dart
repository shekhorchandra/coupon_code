import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DealTile extends StatelessWidget {
  final DealModel deal;

  const DealTile({super.key, required this.deal});

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
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFFF6F7FD)),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: deal.media.first.imageUrl,
              width: 100,
              height: 100,
              fit: .cover,
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
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

                    // Edit button
                    AppButton(
                      text: 'Edit',
                      onPressed: () {},
                      icon: Iconsax.edit_2,
                      height: 40,
                      width: 100,
                    ),

                    const SizedBox(width: 5),

                    // Switcher
                    Switch.adaptive(value: true, onChanged: (value) {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
