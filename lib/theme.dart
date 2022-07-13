import 'package:flutter/material.dart';

import 'extensions.dart';

const primaryColor = Color(0xFFF24726);
const secundaryColor = Color(0xFF414BB2);

final customThemen = ThemeData(
  primarySwatch: primaryColor.material(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((states) => secundaryColor),
    ),
  ),
);
