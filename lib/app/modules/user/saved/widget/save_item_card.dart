import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_color.dart';
import '../controllers/save_controller.dart';

class SaveItemCard extends StatelessWidget {
  final String id;
  final String imagePath;
  final String title;
  final String businessName; // changed from subtitle
  final double price;
  final double originalPrice;
  final bool isAvailable;
  final String Status;
  final VoidCallback onTap;

  const SaveItemCard({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.businessName, // changed
    required this.price,
    required this.originalPrice,
    required this.isAvailable,
    required this.Status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                  topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              child: Image.network(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            // Details section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),

                    // Business Name
                    Text(
                      businessName,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    // Price + Original Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left side: Price + Original Price + Availability
                        Row(
                          children: [
                            Text(
                              "\$$price",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "\$$originalPrice",
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: isAvailable ? AppColor.primary : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                isAvailable ? "Available" : "Expired",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Right side: Delete button
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Delete Saved Deal"),
                                content: const Text("Are you sure you want to remove this saved deal?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop(); // close dialog
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Remove the item using the controller
                                      Get.find<SavesController>().removeSavedDeal(id);
                                      Navigator.of(ctx).pop(); // close dialog

                                      // show confirmation Snackbar
                                      Get.snackbar(
                                        "Deleted",
                                        "The saved deal has been removed",
                                        backgroundColor: Colors.red.shade100,
                                        colorText: Colors.red.shade900,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    },
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        )
                      ],
                    )
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