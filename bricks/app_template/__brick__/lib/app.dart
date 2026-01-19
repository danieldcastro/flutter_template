import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/config/flavors/flavors.dart';
import 'core/ui/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: Modular.routerConfig,
    title: Flavors.appTitle,
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light(),
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.invertedStylus,
      },
    ),
    builder: (context, child) => Material(
      child: SafeArea(
        child: Scaffold(
          body: !Flavors.isProd
              ? Banner(
                  message: 'QA',
                  textDirection: TextDirection.ltr,
                  location: BannerLocation.topEnd,
                  child: child,
                )
              : child,
        ),
      ),
    ),
  );
}
