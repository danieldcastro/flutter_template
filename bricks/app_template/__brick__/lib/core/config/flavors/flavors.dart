import 'flavor.dart';
import 'flavor_env_utils.dart';

class Flavors {
  Flavors._();

  static late final Flavor _current;

  static void init(Flavor flavor) {
    _current = flavor;
  }

  static Flavor get current => _current;

  static String get env => _current.name;

  static String get appTitle => _current.appTitle;

  static bool get isProd => _current.isProd;

  static String get baseUrl => FlavorEnvUtils.baseUrl(_current);
}
