import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppInputTheme {
  AppInputTheme._();

  static const _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(14)),
    borderSide: BorderSide(color: AppSemanticColors.surface),
  );

  static final InputDecorationTheme
  defaultInputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(color: AppSemanticColors.tertiary),
    border: _defaultBorder,
    enabledBorder: _defaultBorder,
    focusedBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(color: AppSemanticColors.primary, width: 2),
    ),
    errorBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(color: AppSemanticColors.error),
    ),
    focusedErrorBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(color: AppSemanticColors.error, width: 2),
    ),
    errorStyle: const TextStyle(color: AppSemanticColors.error, fontSize: 14),
  );
}
