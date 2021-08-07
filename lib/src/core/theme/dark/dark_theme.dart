import 'package:flutter/material.dart';

import '../constants_theme.dart';
import 'dark_text_theme.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Poppins",
  accentColor: ConstantsTheme.accentColor,
  backgroundColor: Color(0xFF102E4A),
  scaffoldBackgroundColor: Color(0xFF2E2E2E),
  textTheme: darkTextTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  shadowColor: ConstantsTheme.greyLightColor,
);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: ConstantsTheme.accentColor,
  ),
);
