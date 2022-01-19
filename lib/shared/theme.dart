import 'package:flutter/material.dart';

import 'colors.dart';

class LightTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: "Poppins",
  ).copyWith(
      primaryColor: AppColors.primaryDark,
      toggleableActiveColor: AppColors.primary,
      bottomSheetTheme: BottomSheetThemeData(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5)))));

}

TextStyle primaryLabelStyle = TextStyle(fontSize: 14, color: Color(0xFFA4A4A4));
TextStyle appBarTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
TextStyle primaryTextStyle =
    TextStyle(fontFamily: 'Inter'); // primary font style
