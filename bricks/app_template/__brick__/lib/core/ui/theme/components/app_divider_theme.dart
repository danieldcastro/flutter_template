import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppDividerTheme {
  AppDividerTheme._();

  static const dividerTheme = DividerThemeData(
    color: AppSemanticColors.border,
    thickness: 1,
    space: 1,
  );
}
