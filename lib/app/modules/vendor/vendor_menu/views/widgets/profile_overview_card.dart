import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/app_circular_avatar.dart';
import 'package:flutter/material.dart';

class ProfileOverviewCard extends StatelessWidget {
  const ProfileOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Color(0xFFf6f7fd), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            children: [
              AppCircularAvatar(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Glamour Glow Salon', style: AppText.h4.semiBold, overflow: .ellipsis),
                  Text(
                    'glamourglow123@gmail.com',
                    style: AppText.body2.medium,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
