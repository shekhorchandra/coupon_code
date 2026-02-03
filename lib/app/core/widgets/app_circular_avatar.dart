import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class AppCircularAvatar extends StatelessWidget {
  const AppCircularAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.vividSky.s300, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(AppAssets.salon, width: 70, height: 70, fit: BoxFit.cover),
      ),
    );
  }
}
