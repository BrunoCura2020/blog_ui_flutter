import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Background Color
  static const Color colorTaskCounterCard = Color(0xff00F0FF);
  static const Color selectedColorBar = Color(0xFF28A931);
  static const Color unSelectedColorBar = Color(0xff8C8C8C);
  static const Color backgroundBlack = Color(0xFF030303);
  static const Color backgroundGrey = Color(0xFFC0BEBE);
  static const Color backgroundDarkGrey = Color(0xFF646464);
}
