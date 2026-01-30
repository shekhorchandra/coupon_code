import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key, required this.icon, required this.title, required this.number});

  final String icon;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Image.asset(icon, height: 34),
              const SizedBox(width: 5),
              Text(title, style: AppText.h5.bold),
            ],
          ),
          Text(number, style: AppText.h5.semiBold),
        ],
      ),
    );
  }
}
