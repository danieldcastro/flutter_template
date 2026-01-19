import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static final ButtonStyle primaryButton =
      ElevatedButton.styleFrom(
        backgroundColor: AppSemanticColors.primary,
        foregroundColor: AppSemanticColors.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.primaryContainer.withAlpha(50),
        ),
      );

  static final ButtonStyle secondaryButton =
      OutlinedButton.styleFrom(
        side: const BorderSide(color: AppSemanticColors.primary),
        foregroundColor: AppSemanticColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.primaryContainer.withAlpha(50),
        ),
      );

  static final ButtonStyle iconButton =
      IconButton.styleFrom(
        backgroundColor: AppSemanticColors.secondary,
        foregroundColor: AppSemanticColors.onSecondary,
        padding: const EdgeInsets.all(4),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.error.withAlpha(50),
        ),
      );

  static final ButtonStyle iconTransparentButton =
      IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppSemanticColors.onSurface,
        padding: const EdgeInsets.all(4),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.tertiary.withAlpha(50),
        ),
      );

  static final ButtonStyle disabledButton = ElevatedButton.styleFrom(
    backgroundColor: AppSemanticColors.surface,
    foregroundColor: AppSemanticColors.onSurface,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    textStyle: const TextStyle(fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static final ButtonStyle dangerButton =
      ElevatedButton.styleFrom(
        backgroundColor: AppSemanticColors.error,
        foregroundColor: AppSemanticColors.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(color: AppSemanticColors.errorContainer),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.errorContainer.withAlpha(50),
        ),
      );

  static final ButtonStyle linkButton =
      TextButton.styleFrom(
        foregroundColor: AppSemanticColors.secondary,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          AppSemanticColors.primaryContainer.withAlpha(50),
        ),
      );
}
