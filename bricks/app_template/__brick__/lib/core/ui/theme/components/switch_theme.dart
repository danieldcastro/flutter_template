import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppSwitchTheme {
  static final SwitchThemeData switchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppSemanticColors.outline;
      }
      if (states.contains(WidgetState.selected)) {
        return AppSemanticColors.success;
      }
      return AppSemanticColors.onSurface;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppSemanticColors.surface.withAlpha(128);
      }
      if (states.contains(WidgetState.selected)) {
        return AppSemanticColors.surface;
      }
      return AppSemanticColors.surface;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppSemanticColors.tertiaryContainer;
      }
      return AppSemanticColors.outline;
    }),
  );
}
