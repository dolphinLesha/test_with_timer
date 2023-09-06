import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColorLight: const Color(0xFFD196F7),
      primaryColor: const Color(0xFF342F93),
      primaryColorDark: const Color(0xFF34063F),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColorLight: const Color(0xFFCC9DFF),
      primaryColor: const Color(0xFF342F93),
      primaryColorDark: const Color(0xFF34063F),
    );
  }
}
