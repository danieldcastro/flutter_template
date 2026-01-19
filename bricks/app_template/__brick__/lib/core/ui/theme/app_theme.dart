import 'package:flutter/material.dart';

import 'colors/app_semantic_colors.dart';
import 'components/app_button_theme.dart';
import 'components/app_card_theme.dart';
import 'components/app_checkbox_theme.dart';
import 'components/app_dropdown_menu_theme.dart';
import 'components/app_icon_theme.dart';
import 'components/app_input_theme.dart';
import 'components/app_radio_button_theme.dart';
import 'components/switch_theme.dart';
import 'extensions.dart/app_custom_colors.dart';
import 'text/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(seedColor: AppSemanticColors.primary)
        .copyWith(
          primary: AppSemanticColors.primary,
          secondary: AppSemanticColors.secondary,
          error: AppSemanticColors.danger,
          surface: AppSemanticColors.surface,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppSemanticColors.background,
      textTheme: AppTextTheme.textTheme,
      inputDecorationTheme: AppInputTheme.defaultInputDecorationTheme,
      cardTheme: AppCardTheme.cardTheme,
      dropdownMenuTheme: AppDropdownMenuTheme.dropdownMenuTheme,
      iconTheme: AppIconTheme.iconTheme,
      primaryIconTheme: AppIconTheme.iconTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonTheme.primaryButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppButtonTheme.secondaryButton,
      ),
      textButtonTheme: TextButtonThemeData(style: AppButtonTheme.linkButton),
      iconButtonTheme: IconButtonThemeData(style: AppButtonTheme.iconButton),
      checkboxTheme: AppCheckboxTheme.checkboxTheme,
      radioTheme: AppRadioButtonTheme.radioTheme,
      switchTheme: AppSwitchTheme.switchTheme,
      dividerTheme: DividerThemeData(
        color: AppSemanticColors.border.withAlpha(120),
      ),
      extensions: [
        AppCustomColors(
          success: AppSemanticColors.success,
          successLight: AppSemanticColors.successLight,
          warning: AppSemanticColors.warning,
          border: AppSemanticColors.border,
          shadow: AppSemanticColors.shadow,
          primaryGradient: LinearGradient(
            colors: const [
              AppSemanticColors.primary,
              AppSemanticColors.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}
