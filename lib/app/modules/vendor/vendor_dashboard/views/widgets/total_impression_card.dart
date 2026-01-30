import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class TotalImpressionCard extends StatelessWidget {
  const TotalImpressionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text('Total Impression: 10,586', style: AppText.h5.semiBold),
          Row(
            children: [
              Icon(Icons.trending_up_rounded, color: Color(0xFFFFC100)),
              const SizedBox(width: 5),
              Text('21%', style: AppText.h5.semiBold),
              const SizedBox(width: 5),
              Text('CTR', style: AppText.h5.semiBold.copyWith(color: Color(0xFFFFC100))),
            ],
          ),
        ],
      ),
    );
  }
}
