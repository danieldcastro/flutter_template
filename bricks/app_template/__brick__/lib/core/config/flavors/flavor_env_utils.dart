import 'flavor.dart';

class FlavorEnvUtils {
  FlavorEnvUtils._();

  static String baseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.qa:
        return const String.fromEnvironment('API_URL_QA');
      case Flavor.prod:
        return const String.fromEnvironment('API_URL_PROD');
    }
  }
}
