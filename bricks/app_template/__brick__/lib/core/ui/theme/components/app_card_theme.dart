import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static final cardTheme = CardThemeData(
    margin: EdgeInsets.zero,
    color: AppSemanticColors.onPrimary,
    shadowColor: AppSemanticColors.shadow,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
