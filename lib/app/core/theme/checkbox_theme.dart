import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

final checkboxTheme = CheckboxThemeData(
  checkColor: WidgetStateProperty.all(AppColor.white),
  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.selected)) {
      return AppColor.primary;
    }
    return Colors.transparent;
  }),
);
