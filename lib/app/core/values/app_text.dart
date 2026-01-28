library;

import 'package:flutter/material.dart';

const _textScaleFactor = 1;

abstract class AppFontWeight {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

class _TextStyleBuilder {
  const _TextStyleBuilder(this.fontSize, this.height);

  final double fontSize;
  final double height;

  TextStyle get regular => _build(AppFontWeight.regular);
  TextStyle get medium => _build(AppFontWeight.medium);
  TextStyle get semiBold => _build(AppFontWeight.semiBold);
  TextStyle get bold => _build(AppFontWeight.bold);

  TextStyle call() => regular;

  TextStyle _build(FontWeight weight) {
    return TextStyle(
      fontFamily: 'Lufga',
      fontSize: fontSize * _textScaleFactor,
      height: height,
      fontWeight: weight,
    );
  }
}

abstract class AppText {
  // Titles: Used for Hero sections or large page titles
  static const title = _TextStyleBuilder(34, 1.2);
  static const title1 = _TextStyleBuilder(28, 1.2);

  // Headings: Structural hierarchy for the app
  static const h1 = _TextStyleBuilder(24, 1.3);
  static const h2 = _TextStyleBuilder(22, 1.3);
  static const h3 = _TextStyleBuilder(20, 1.3);
  static const h4 = _TextStyleBuilder(18, 1.4);
  static const h5 = _TextStyleBuilder(16, 1.4);

  // Body: The meat of your content
  static const body1 = _TextStyleBuilder(16, 1.5);
  static const body2 = _TextStyleBuilder(14, 1.4);

  // Label: Smallest UI elements
  static const label = _TextStyleBuilder(12, 1.3);

  static final textTheme = TextTheme(
    // Display styles (Very large, short-form text)
    displayLarge: AppText.title.bold,
    displayMedium: AppText.title1.bold,
    displaySmall: AppText.h1.semiBold,

    // Headlines (Emphasis for key sections)
    headlineLarge: AppText.h1.semiBold,
    headlineMedium: AppText.h2.semiBold,
    headlineSmall: AppText.h3.semiBold,

    // Titles (Structural text, AppBars, List items)
    titleLarge: AppText.h4.semiBold,
    titleMedium: AppText.h5.medium,
    titleSmall: AppText.body1.medium,

    // Body (Paragraphs and content)
    bodyLarge: AppText.body1.regular,
    bodyMedium: AppText.body2.regular,
    bodySmall: AppText.label.regular,

    // Labels (Buttons, tags, small descriptors)
    labelLarge: AppText.h5.medium,
    labelMedium: AppText.body2.medium,
    labelSmall: AppText.label.medium,
  );
}
