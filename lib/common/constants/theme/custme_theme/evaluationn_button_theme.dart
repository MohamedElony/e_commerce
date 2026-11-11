import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:flutter/material.dart';

class TELevaltedButtnTheme {
  static final ElevatedButtonThemeData lightElevatdButtonTheme = ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: MyAppColor.lightMoodColor,
    disabledForegroundColor: MyAppColor.disabledColor,
    disabledBackgroundColor: MyAppColor.disabledColor,
    side:  BorderSide(color: MyAppColor.primaryColor),
    padding: EdgeInsets.symmetric(vertical: 18),
    textStyle: TextStyle(fontSize: 16,color: MyAppColor.lightMoodColor,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  ));
static final ElevatedButtonThemeData darkElevatdButtonTheme = ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: MyAppColor.darkMoodColor,
    disabledForegroundColor: MyAppColor.disabledColor,
    disabledBackgroundColor: MyAppColor.disabledColor,
    side:  BorderSide(color: MyAppColor.primaryColor),
    padding: EdgeInsets.symmetric(vertical: 18),
    textStyle: TextStyle(fontSize: 16,color: MyAppColor.darkMoodColor,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  ));}
