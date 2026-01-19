import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'core/config/flavors/flavor.dart';
import 'core/config/flavors/flavors.dart';
import 'core/di/app_module.dart';
import 'core/infra/http/app_http_overrides.dart';

Future<void> bootstrap({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = AppHttpOverrides();

  Flavors.init(flavor);

  runApp(ModularApp(module: AppModule(), child: const App()));
}
