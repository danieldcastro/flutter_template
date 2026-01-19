
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
  static const outline = AppPalette.gray400;

  // Status
  static const success = AppPalette.success;
  static const successLight = AppPalette.successLight;
  static const warning = AppPalette.warning;
  static const danger = AppPalette.danger;
  static const error = AppPalette.danger;
  static const errorContainer =
      AppPalette.danger; // Using danger as base for now

  // On Colors
  static const onPrimary = AppPalette.white;
  static const onSecondary = AppPalette.white;
  static const onSurface = AppPalette.gray800;

  // Containers
  static const primaryContainer = AppPalette.primary;
  static const tertiaryContainer = AppPalette.gray100;
  static const tertiary = AppPalette.gray600; // Placeholder for tertiary
}
