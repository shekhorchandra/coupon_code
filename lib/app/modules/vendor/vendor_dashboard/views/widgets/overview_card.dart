import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    this.icon,
    required this.title,
    required this.number,
    this.isLoading = false,
  });

  final String? icon;
  final String title;
  final String number;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              if (icon != null) ...[Image.asset(icon!, height: 34), const SizedBox(width: 5)],
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppText.h5.medium,
                ),
              ),
            ],
          ),
          if (isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 50,
                child: LinearProgressIndicator(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                  minHeight: 5,
                ),
              ),
            ),
          if (!isLoading) Text(number == "-1" ? "N/A" : number.toString(), style: AppText.h5.bold),
        ],
      ),
    );
  }
}
