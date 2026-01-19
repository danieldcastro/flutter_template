import 'package:flutter/material.dart';

import '../colors/app_semantic_colors.dart';

class AppDropdownMenuTheme {
  static final dropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      hoverColor: AppSemanticColors.secondary.withAlpha(30),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    ),
    menuStyle: MenuStyle(
      alignment: Alignment.bottomCenter,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    ),
  );
}
