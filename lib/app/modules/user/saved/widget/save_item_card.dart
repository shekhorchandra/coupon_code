import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_color.dart';
import '../controllers/save_controller.dart';

class SaveItemCard extends StatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  final String businessName;
  final double price;
  final double originalPrice;
  final bool isAvailable;
  final String status;
  final DateTime? promotedUntil;
  final VoidCallback onTap;

  const SaveItemCard({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.businessName,
    required this.price,
    required this.originalPrice,
    required this.isAvailable,
    required this.status,
    required this.onTap,
    this.promotedUntil,
  });

  @override
  State<SaveItemCard> createState() => _SaveItemCardState();
}

class _SaveItemCardState extends State<SaveItemCard> {
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

  /// Remaining time with seconds
  String getRemainingTime() {
    if (widget.promotedUntil == null) return "Expired";

    final remaining = widget.promotedUntil!.difference(DateTime.now());

    if (remaining.isNegative) return "Expired";

    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

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
    final remainingTimeText = getRemainingTime();

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: widget.onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            /// Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                widget.imagePath,
                width: 120,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 120,
                  height: 140,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),

            /// Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      widget.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),

                    /// Business name
                    Text(
                      widget.businessName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Price
                    Row(
                      children: [
                        Text(
                          "\$${widget.price}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "\$${widget.originalPrice}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Status + Delete
                    Row(
                      children: [
                        /// Countdown badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: remainingTimeText == "Expired"
                                ? Colors.red
                                : Colors.orange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            remainingTimeText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const Spacer(),

                        /// Delete button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Delete Saved Deal"),
                                  content: const Text(
                                      "Are you sure you want to remove this saved deal?"),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade300,
                                        foregroundColor: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.find<SavesController>()
                                            .deleteSavedDeal(widget.id);
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}