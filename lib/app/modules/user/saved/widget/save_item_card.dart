import 'package:flutter/material.dart';

import '../../../../core/values/app_color.dart';


class SaveItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final double originalPrice;
  final String duration;
  final bool isAvailable;
  final String Status;
  final VoidCallback onTap;


  const SaveItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.originalPrice,
    required this.duration,
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
              )
            ),

            // Details section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // prevents RenderFlex overflow
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
                    const SizedBox(height: 4),

                    // Subtitle
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 6),

                    // Price + Original Price + Duration
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
                        Text(
                          duration,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isAvailable
                                ? AppColor.primary
                                : Colors.grey.shade300,
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
                              color: isAvailable ? Colors.grey.shade700 : Colors.grey.shade700, // text color
                              fontSize: 12,
                            ),
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
