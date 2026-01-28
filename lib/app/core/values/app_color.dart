import 'package:flutter/material.dart';

@immutable
class ColorScale {
  final Color s50;
  final Color s100;
  final Color s200;
  final Color s300;
  final Color s400;
  final Color s500;
  final Color s600;
  final Color s700;
  final Color s800;
  final Color s900;
  final Color s950;

  const ColorScale({
    required this.s50,
    required this.s100,
    required this.s200,
    required this.s300,
    required this.s400,
    required this.s500,
    required this.s600,
    required this.s700,
    required this.s800,
    required this.s900,
    required this.s950,
  });

  Color get value => s500;

  Color call() => value;
}

abstract class AppColor {
  const AppColor._();

  /// Previous Colors
  static const primary = Color(0xFF4BBDCF);
  static const secondary = Color(0xFF4BBDCF);
  static const titleColor = Color(0xFF00616F);
  static const border = Color(0xFFE0E0E0);
  static const greyText = Colors.grey;
  static const textcolor = Colors.black;
  static const buttonText = Colors.white;
  static const togglebackground = Color(0xFFF0F9FF);

  /// Primary
  static const vividSky = ColorScale(
    s50: Color(0xFFD1FEFF),
    s100: Color(0xFFA8EBF7),
    s200: Color(0xFF7DD4E3),
    s300: Color(0xFF4BBDCF),
    s400: Color(0xFF4BBDCF),
    s500: Color(0xFF2B9DAE),
    s600: Color(0xFF007E8E),
    s700: Color(0xFF00616F),
    s800: Color(0xFF00444E),
    s900: Color(0xFF002A33),
    s950: Color(0xFF001318),
  );

  /// Secondary
  static const sky = ColorScale(
    s50: Color(0xFFF0F9FF),
    s100: Color(0xFFE0F2FE),
    s200: Color(0xFFBAE6FD),
    s300: Color(0xFF7DD3FC),
    s400: Color(0xFF38BDF8),
    s500: Color(0xFF0EA5E9),
    s600: Color(0xFF0284C7),
    s700: Color(0xFF0369A1),
    s800: Color(0xFF075985),
    s900: Color(0xFF0C4A6E),
    s950: Color(0xFF082F49),
  );

  /// Black & White / Neutral
  static const bw = ColorScale(
    s50: Color(0xFFEEEEEE),
    s100: Color(0xFFD1D1D1),
    s200: Color(0xFFB4B4B4),
    s300: Color(0xFF989898),
    s400: Color(0xFF7D7D7D),
    s500: Color(0xFF636363),
    s600: Color(0xFF4A4A4A),
    s700: Color(0xFF333333),
    s800: Color(0xFF1D1D1D),
    s900: Color(0xFF090909),
    s950: Color(0xFF000000),
  );

  static const Color white = Color(0xFFFFFFFF);

  static const Color error = Color(0xFFDF2A16);
  static const Color warning = Color(0xFFFFBD11);
  static const Color success = Color(0xFF128635);

  /// Black 950
  static Color onLight = bw.s950;

  /// White 50
  static Color onDark = bw.s50;

  /// White 50
  static Color get onPrimary => onDark;

  /// White 50
  static Color get onSecondary => onDark;

  /// White 50
  static Color get onError => onDark;

  /// White 50
  static Color get onSuccess => onDark;

  /// White 50
  static Color get onWarning => onDark;

  Color onColor(Color color) => color.computeLuminance() > 0.5 ? onLight : onDark;
}

class AppColorScheme {
  AppColorScheme._();

  static final light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColor.vividSky.s500,
    onPrimary: AppColor.onPrimary,
    primaryContainer: AppColor.vividSky.s50,
    onPrimaryContainer: AppColor.onLight,

    secondary: AppColor.sky.s500,
    onSecondary: AppColor.onSecondary,
    secondaryContainer: AppColor.sky.s100,
    onSecondaryContainer: AppColor.sky.s900,

    error: AppColor.error,
    onError: AppColor.onError,
    errorContainer: AppColor.success,
    onErrorContainer: AppColor.onSuccess,

    // surfaceBright: ,
    surface: AppColor.white,

    // surfaceContainerLow: ,
    // surfaceContainerLowest: ,
    surfaceContainer: AppColor.bw.s50,
    surfaceContainerHigh: AppColor.bw.s100,
    surfaceContainerHighest: AppColor.bw.s200,

    // surfaceDim: ,
    // surfaceTint: ,
    onSurface: AppColor.onLight,
    onSurfaceVariant: AppColor.bw.s700,

    outline: AppColor.bw.s300,
    outlineVariant: AppColor.bw.s200,

    shadow: Colors.black,
    scrim: Colors.black,

    inverseSurface: AppColor.bw.s900,
    onInverseSurface: AppColor.white,

    inversePrimary: AppColor.vividSky.s200,
  );
}
