import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class AppCircularAvatar extends StatefulWidget {
  final String imageUrl;

  const AppCircularAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _AppCircularAvatarState createState() => _AppCircularAvatarState();
}

class _AppCircularAvatarState extends State<AppCircularAvatar> {
  late final CachedNetworkImageProvider _cachedImage;

  @override
  void initState() {
    super.initState();
    // Preload image into memory
    _cachedImage = CachedNetworkImageProvider(widget.imageUrl);
    _cachedImage
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo image, bool synchronousCall) {}));
  }

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
          imageUrl: widget.imageUrl,
          fadeInDuration: const Duration(milliseconds: 300),
          placeholder: (context, url) =>
              const SizedBox(height: 60, width: 60, child: CircularProgressIndicator.adaptive()),
          errorWidget: (context, url, error) =>
              const Padding(padding: EdgeInsets.all(12.0), child: Icon(Icons.error)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
