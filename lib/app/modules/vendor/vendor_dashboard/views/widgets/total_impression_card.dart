import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/linear_loading.dart';
import 'package:flutter/material.dart';

class TotalImpressionCard extends StatelessWidget {
  const TotalImpressionCard({
    super.key,
    required this.totalImpressions,
    required this.ctr,
    this.isLoading = false,
  });

  final String totalImpressions;
  final String ctr;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    String impressionCount = totalImpressions == "-1" ? "N/A" : totalImpressions;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            children: [
              Text('Total Impression: ', style: AppText.h5.semiBold),
              if (isLoading) LinearLoading(),
              if (!isLoading) Text(impressionCount, style: AppText.h5.semiBold),
            ],
          ),
          if (isLoading) LinearLoading(),
          if (!isLoading)
            Row(
              children: [
                Icon(Icons.trending_up_rounded, color: Color(0xFFFFC100)),
                const SizedBox(width: 5),
                Text(ctr == "-1.0" ? "N/A" : '$ctr%', style: AppText.h5.semiBold),
                const SizedBox(width: 5),
                Text('CTR', style: AppText.h5.semiBold.copyWith(color: Color(0xFFFFC100))),
              ],
            ),
        ],
      ),
    );
  }
}
