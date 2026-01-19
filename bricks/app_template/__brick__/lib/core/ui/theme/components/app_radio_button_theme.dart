import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppRadioButtonTheme {
  static final RadioThemeData radioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppSemanticColors.surface;
      }
      if (states.contains(WidgetState.selected)) {
        return AppSemanticColors.primary;
      }
      return AppSemanticColors.onSurface;
    }),
  );
}
