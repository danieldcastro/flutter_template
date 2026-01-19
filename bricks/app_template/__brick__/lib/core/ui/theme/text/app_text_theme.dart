import 'package:flutter/material.dart';

import 'font_family.dart';

class AppTextTheme {
  static final String _fontFamily = FontFamily.roboto.name;

  static TextStyle _style(double size, FontWeight weight) => TextStyle(
    fontSize: size,
    fontWeight: weight,
    fontFamily: _fontFamily,
    height: 1.2,
  );

  static final TextTheme textTheme = TextTheme(
    // Títulos
    displayLarge: _style(48, FontWeight.w900),
    displayMedium: _style(36, FontWeight.w800),
    displaySmall: _style(30, FontWeight.w700),
    headlineMedium: _style(25, FontWeight.w500),
    headlineSmall: _style(21, FontWeight.w400),
    titleLarge: _style(18, FontWeight.w400),

    // Subtítulos
    titleMedium: _style(15, FontWeight.w400),
    titleSmall: _style(13, FontWeight.w400),

    // Corpo do Texto
    bodyLarge: _style(16, FontWeight.w400),
    bodyMedium: _style(14, FontWeight.w400),

    // Detalhes
    bodySmall: _style(12, FontWeight.w400),
  );
}
