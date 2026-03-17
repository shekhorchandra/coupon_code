import 'dart:async';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../models/deal_card_model.dart';

class DealCard extends StatefulWidget {
  final DealCardModel deal;
  final int index;

  const DealCard({super.key, required this.deal, required this.index});

  @override
  State<DealCard> createState() => _DealCardState();
}

class _DealCardState extends State<DealCard> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    /// rebuild every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  /// Live countdown (day, hour, min, sec)
  String getTimeLeft(DateTime? endTime) {
    if (endTime == null) return "";

    final now = DateTime.now();
    if (endTime.isBefore(now)) return "Expired";

    final difference = endTime.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    if (days > 0) {
      return "${days}d ${hours.toString().padLeft(2, '0')}h "
          "${minutes.toString().padLeft(2, '0')}m "
          "${seconds.toString().padLeft(2, '0')}s";
    } else {
      return "${hours.toString().padLeft(2, '0')}h "
          "${minutes.toString().padLeft(2, '0')}m "
          "${seconds.toString().padLeft(2, '0')}s";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isShort = widget.index % 2 == 0;

    final imageUrl = widget.deal.images.isNotEmpty ? widget.deal.images.first : '';

    final priceAfterDiscount = DealCardModel.afterDiscountPrice(
      widget.deal.regularPrice,
      widget.deal.discountPercent,
    );

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
          /// IMAGE + OVERLAY
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

              /// Distance
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
                    "${(widget.deal.distance / 1000).toStringAsFixed(2)} km away",
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),

              /// Discount
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
                    "${widget.deal.discountPercent.toInt()}% OFF",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  widget.deal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),

                const SizedBox(height: 4),

                /// SHOP
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.shopDetails, arguments: {"shopId": widget.deal.shopId});
                  },
                  child: Text(
                    widget.deal.shopName,
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),

                const SizedBox(height: 8),

                /// PRICE + TIMER
                Row(
                  children: [
                    Text(
                      "\$${priceAfterDiscount.toStringAsFixed(1)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$${widget.deal.regularPrice.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),


                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// LIVE TIMER
                    if (widget.deal.promotedUntil != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          getTimeLeft(widget.deal.promotedUntil),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 8),

                /// BUTTON
                AppButton(
                  text: "Redeem Now",
                  height: 36,
                  width: double.infinity,
                  onPressed: () {
                    Get.toNamed('/discover-details', arguments: {'id': widget.deal.id});
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
