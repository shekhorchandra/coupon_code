import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class LinearLoading extends StatelessWidget {
  const LinearLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 50,
        child: LinearProgressIndicator(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(20),
          minHeight: 5,
        ),
      ),
    );
  }
}
