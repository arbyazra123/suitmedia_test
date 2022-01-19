import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Theme Color
  static const Color primary = Color(0xFF2B637B);
  static const Color accent = Color(0xFF554AF0);
  static const Color appWhite = Color(0xfff5f5f5);
  static const Color primaryDark = Color(0xFF242F41);
  static const Color bgTextField = Color(0xFFF4F8FF);
  static const Color unselected = Color(0xFFD3D3D3);
  static const Color unselectedText = Color(0xFF787878);

  // gradient
  static LinearGradient primaryGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        primary,
        primary,
      ],
      tileMode: TileMode.repeated);
}
