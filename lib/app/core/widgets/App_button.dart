import 'package:flutter/material.dart';

import '../values/app_color.dart';
import '../values/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Widget? leading;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double width;
  final double height;
  final IconData? icon;
  final bool loading;

  const AppButton({
    super.key,
    this.leading,
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor = AppColor.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 52,
    this.icon,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1.5)
                : BorderSide.none,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: loading
              ? const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColor.titleColor,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 8),
              ] else if (icon != null) ...[
                Icon(icon, size: 18, color: textColor),
                const SizedBox(width: 6),
              ],
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.TextButton
                    .copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
