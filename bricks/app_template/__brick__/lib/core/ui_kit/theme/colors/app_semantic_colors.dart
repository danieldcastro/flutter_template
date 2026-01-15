import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppSemanticColors {
  AppSemanticColors._();

  // Core
  static const primary = AppPalette.primary;
  static const secondary = AppPalette.secondary;

  // Surfaces
  static const background = AppPalette.white;
  static const surface = AppPalette.gray50;

  // Text
  static const textPrimary = AppPalette.gray800;
  static const textSecondary = AppPalette.gray600;

  // UI details
  static const border = AppPalette.gray200;
  static final shadow = AppPalette.gray200.withAlpha(90);

  // Status
  static const success = AppPalette.success;
  static const successLight = AppPalette.successLight;
  static const warning = AppPalette.warning;
  static const danger = AppPalette.danger;
}
