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
  final String Status;
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

                    // Price + Original Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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

                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isAvailable ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            isAvailable ? 'Available' : 'Expired',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Right side: Delete button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade100, // background color
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showDialog(

                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Delete Saved Deal"),
                                  content: const Text("Are you sure you want to remove this saved deal?"),
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
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
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