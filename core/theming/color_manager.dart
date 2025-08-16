import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
  static const Color redAccent = Colors.redAccent;
  static const Color black = Colors.black;
  static const Color amber = Colors.amber;
  static Color red = Colors.red;
  static Color blue = Colors.blue;
  static Color greyCustomShade = const Color(0xFF515B6E);
  static const Color primary = Color(0xFF1976D2); // Blue
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyshade100 = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF9E9E9E);

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF0D47A1);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkGrey = Color(0xFF424242);
}

class AppColors {
  final Color primary;
  final Color background;
  final Color surface;
  final Color text;
  final Color secondaryText;

  const AppColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.text,
    required this.secondaryText,
  });

  static const light = AppColors(
    primary: ColorManager.primary,
    background: ColorManager.greyshade100,
    surface: ColorManager.white,
    text: Colors.black87,
    secondaryText: ColorManager.grey,
  );

  static const dark = AppColors(
    primary: ColorManager.darkPrimary,
    background: ColorManager.darkSurface,
    surface: Color(0xFF1E1E1E),
    text: Colors.white,
    secondaryText: ColorManager.darkGrey,
  );
}
