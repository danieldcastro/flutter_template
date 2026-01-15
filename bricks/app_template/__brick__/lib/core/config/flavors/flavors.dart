import 'flavor_enum.dart';
import 'flavor_env_utils.dart';

class Flavors {
  Flavors._();

  static late final FlavorEnum _current;

  static void init(FlavorEnum flavor) {
    _current = flavor;
  }

  static FlavorEnum get current => _current;

  static String get env => _current.name;

  static String get appTitle => _current.appTitle;

  static bool get isProd => _current.isProd;

  static String get baseUrl => FlavorEnvUtils.baseUrl(_current);
}
