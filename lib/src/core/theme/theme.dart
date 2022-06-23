import 'package:flutter/material.dart';
import 'package:imagineapp_test_gap/src/core/app_values/fonts.dart';
import 'package:imagineapp_test_gap/src/core/theme/type.dart';
import 'package:imagineapp_test_gap/src/core/theme/ui_colors.dart';

final ThemeData materialTheme = ThemeData(
  primaryColor: UIColors.greenBase,
  backgroundColor: UIColors.white,
  colorScheme: const ColorScheme.light(
    primary: UIColors.greenBase,
    secondary: UIColors.white,
  ),
  fontFamily: UIFonts.primary,
  textTheme: TextTheme(
    headline1: h1,
    headline2: h2,
    headline3: h3,
    subtitle1: normalText,
    bodyText1: smallText,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: smallText,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: UIColors.greenBase,
  ),
);
