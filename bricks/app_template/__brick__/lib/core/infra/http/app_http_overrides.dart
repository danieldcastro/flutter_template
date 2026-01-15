import 'dart:io';

import 'package:flutter/foundation.dart';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);

    if (!kDebugMode) return client; // Só ativa em modo debug

    if (Platform.isWindows) {
      client.findProxy = (uri) =>
          'PROXY localhost:8000'; // Direciona para proxy local no Windows
    }

    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) =>
            true; // Aceita certificados inválidos

    return client;
  }
}
