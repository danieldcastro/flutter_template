import 'flavor_enum.dart';

class FlavorEnvUtils {
  FlavorEnvUtils._();

  static String baseUrl(FlavorEnum flavor) {
    switch (flavor) {
      case FlavorEnum.qa:
        return const String.fromEnvironment('API_URL_QA');
      case FlavorEnum.prod:
        return const String.fromEnvironment('API_URL_PROD');
    }
  }
}
