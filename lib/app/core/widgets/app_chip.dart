import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.success, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(text, style: AppText.body2.bold.copyWith(color: AppColor.white)),
    );
  }
}
