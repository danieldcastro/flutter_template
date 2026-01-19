import 'package:flutter/material.dart';

import '../../ui/theme/extensions.dart/app_custom_colors.dart';

extension ThemeContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get text => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  AppCustomColors get customColors {
    final ext = theme.extension<AppCustomColors>();
    assert(
      ext != null,
      'AppCustomColors não foi registrado em ThemeData.extensions',
    );
    return ext!;
  }
}
