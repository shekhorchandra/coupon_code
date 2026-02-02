import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class DealCreationPreviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DealCreationPreviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          color: AppColor.sky.s50,
          border: Border.all(color: AppColor.vividSky.s600),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: .min,
          children: [
            Icon(Icons.remove_red_eye_outlined, color: AppColor.vividSky.s600),
            const SizedBox(width: 10),
            Text(
              'Previewing as a user',
              style: AppText.body2.bold.copyWith(color: AppColor.vividSky.s600),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
