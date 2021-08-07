import 'package:flutter/material.dart';

import '../constants_theme.dart';
import 'text_theme.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Poppins",
  accentColor: ConstantsTheme.accentColor,
  backgroundColor: ConstantsTheme.backgroundColor,
  scaffoldBackgroundColor: ConstantsTheme.backgroundColor,
  textTheme: textTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  shadowColor: ConstantsTheme.greyLightColor,
);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: ConstantsTheme.accentColor,
  ),
);
