import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_color.dart';
import '../controllers/save_controller.dart';

class SaveItemCard extends StatelessWidget {
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

  // Get remaining promotion time
  String getRemainingTime() {
    if (promotedUntil == null) return "Expired";

    final remaining = promotedUntil!.difference(DateTime.now());

    if (remaining.isNegative) return "Expired";
    if (remaining.inDays > 0) return "${remaining.inDays} days left";
    if (remaining.inHours > 0) return "${remaining.inHours} hours left";
    if (remaining.inMinutes > 0) return "${remaining.inMinutes} minutes left";
    return "Expiring soon";
  }

  @override
  Widget build(BuildContext context) {
    final remainingTimeText = getRemainingTime();

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imagePath,
                width: 120,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),

            // Details section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),

                    // Business name
                    Text(
                      businessName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    // Price row
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("\$$price", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 6),
                            Text("\$$originalPrice", style: const TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          ],
                        ),

                      ],
                    ),

                    // Promotion / availability & delete button
                    Row(
                      children: [
                        // Unified status
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isAvailable ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            getRemainingTime(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Delete button
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
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.find<SavesController>().deleteSavedDeal(id);
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