import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get baseColorLoading => brightness == Brightness.light
      ? const Color(0xFFECECEC)
      : const Color(0xFFBBBBBB);

  Color get highlightColorLoading => brightness == Brightness.light
      ? const Color(0xFFF9F9FB)
      : const Color(0xFFBBBBBB);
}
