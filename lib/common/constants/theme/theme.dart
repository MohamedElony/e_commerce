
import 'package:e_commerce/common/constants/theme/custme_theme/appbar_thee.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/bottom_sheet_thee.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/checkboox_theme.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/chip_theme.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/evaluationn_button_theme.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/outlined_button_theme.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/text_field_theme.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: MyAppColor.primaryColor,
    scaffoldBackgroundColor: MyAppColor.lightMoodColor,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TELevaltedButtnTheme.lightElevatdButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: MyAppColor.primaryColor,
    scaffoldBackgroundColor: MyAppColor.darkMoodColor,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TELevaltedButtnTheme.darkElevatdButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
