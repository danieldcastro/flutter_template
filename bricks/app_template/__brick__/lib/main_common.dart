import 'dart:io';

import 'package:flutter/widgets.dart';

import 'app.dart';
import 'core/config/flavors/flavor_enum.dart';
import 'core/config/flavors/flavors.dart';
import 'core/infra/http/app_http_overrides.dart';

Future<void> bootstrap({
  required FlavorEnum flavor,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = AppHttpOverrides();

  Flavors.init(flavor);

  runApp(const App());
}
