import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class AppCircularAvatar extends StatelessWidget {
  const AppCircularAvatar({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.vividSky.s300, width: 2),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, progress) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
          errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
        ),
      ),
    );
  }
}
