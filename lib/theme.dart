import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF24726);
const secondaryColor = Color(0xFF414BB2);
const backgroundColor = Color(0xFFFFFFFF);
const onBackgroundColor = Color(0xFF1A1A1A);
const surfaceColor = Color(0xFF808080);
const onSurfaceColor = Color(0xFF1A1A1A);

final customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    background: secondaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((states) => secondaryColor),
    ),
  ),
);
