import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: MyAppColor.darkMoodColor),
    headlineMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: MyAppColor.darkMoodColor),
    headlineSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: MyAppColor.darkMoodColor),

    titleLarge: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: MyAppColor.darkMoodColor),
    titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: MyAppColor.darkMoodColor),
    titleSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: MyAppColor.darkMoodColor),

    bodyLarge: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: MyAppColor.darkMoodColor),
    bodyMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: MyAppColor.darkMoodColor),
    bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: MyAppColor.darkMoodColor),

    labelLarge: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: MyAppColor.darkMoodColor),
    labelMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: MyAppColor.darkMoodColor),
  );
  static TextTheme darkTextTheme = TextTheme(

    headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: MyAppColor.lightMoodColor),
    headlineMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color:MyAppColor.lightMoodColor),
    headlineSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: MyAppColor.lightMoodColor),

    titleLarge: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: MyAppColor.lightMoodColor),
    titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: MyAppColor.lightMoodColor),
    titleSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: MyAppColor.lightMoodColor),

    bodyLarge: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: MyAppColor.lightMoodColor),
    bodyMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: MyAppColor.lightMoodColor),
    bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: MyAppColor.lightMoodColor),

    labelLarge: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: MyAppColor.lightMoodColor),
    labelMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: MyAppColor.lightMoodColor),
  );
}
