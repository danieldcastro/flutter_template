import 'package:flutter/material.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  const AppCustomColors({
    required this.success,
    required this.successLight,
    required this.warning,
    required this.border,
    required this.shadow,
    required this.primaryGradient,
  });

  final Color success;
  final Color successLight;
  final Color warning;

  final Color border;
  final Color shadow;

  final Gradient primaryGradient;

  @override
  AppCustomColors copyWith({
    Color? success,
    Color? successLight,
    Color? warning,
    Color? border,
    Color? shadow,
    Gradient? primaryGradient,
  }) => AppCustomColors(
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      warning: warning ?? this.warning,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;

    return AppCustomColors(
      success: Color.lerp(success, other.success, t) ?? success,
      successLight:
          Color.lerp(successLight, other.successLight, t) ?? successLight,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      border: Color.lerp(border, other.border, t) ?? border,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
      primaryGradient: t < 0.5 ? primaryGradient : other.primaryGradient,
    );
  }
}
