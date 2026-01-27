import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;

  const CommonAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
    this.actions,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.titleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,

      leading: showBack
          ? IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: iconColor,
          size: 20,
        ),
        onPressed: onBack ?? () => Get.back(),
      )
          : null,

      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
