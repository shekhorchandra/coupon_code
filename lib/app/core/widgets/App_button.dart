import 'package:flutter/material.dart';

import '../values/app_color.dart';
import '../values/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColor.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    // this.width = 400,
    this.height = 52,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        label: Text(text, style: AppTextStyles.TextButton.copyWith(color: textColor)),
        icon: icon != null ? Icon(icon, color: AppColor.white) : SizedBox.shrink(),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
