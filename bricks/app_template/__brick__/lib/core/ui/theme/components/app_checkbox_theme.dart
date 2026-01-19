import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppCheckboxTheme {
  static final CheckboxThemeData checkboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppSemanticColors.surface;
      }
      if (states.contains(WidgetState.selected)) {
        return AppSemanticColors.primary;
      }
      return AppSemanticColors.outline;
    }),
    checkColor: WidgetStateProperty.all(AppSemanticColors.onPrimary),
    side: const BorderSide(color: AppSemanticColors.primary),
  );
}
