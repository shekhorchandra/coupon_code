// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, this.subtitle, this.cta, this.ctaOnTap});

  final String title;
  final String? subtitle;
  final String? cta;
  final Function()? ctaOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColor.vividSky.s700,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 10),

            // SUBTITLE
            if (subtitle != null)
              Text(subtitle!, style: TextStyle(fontSize: 12, color: AppColor.bw.s500)),
          ],
        ),

        if (cta != null && ctaOnTap != null)
          TextButton(
            onPressed: ctaOnTap,
            child: Text(cta!, style: AppText.body1.medium.copyWith(color: AppColor.bw.s500)),
          ),
      ],
    );
  }
}
