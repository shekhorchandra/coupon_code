import 'package:coupon_code/app/core/widgets/skeleton.dart';
import 'package:flutter/material.dart';


class DealCardSkeleton extends StatelessWidget {
  const DealCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Image
          const Skeleton(
            height: 200,
            width: double.infinity,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Skeleton(height: 16, width: 160),

                SizedBox(height: 8),

                Skeleton(height: 12, width: 120),

                SizedBox(height: 12),

                Skeleton(height: 16, width: 80),

                SizedBox(height: 12),

                Skeleton(height: 36, width: double.infinity),
              ],
            ),
          )
        ],
      ),
    );
  }
}