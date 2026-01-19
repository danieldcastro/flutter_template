import 'package:flutter_modular/flutter_modular.dart';

import 'i_nav.dart';

class NavImpl implements INav {
  @override
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => Modular.to.pushNamed<T>(routeName, arguments: arguments);

  @override
  Future<T?> pushReplacementNamed<T extends Object?, R extends Object?>(
    String routeName, {
    R? result,
    Object? arguments,
  }) => Modular.to.pushReplacementNamed<T, R>(
      routeName,
      arguments: arguments,
    );

  @override
  Future<T?> pushNamedAndClearStack<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => Modular.to.pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );

  @override
  void navigate(String routeName, {Object? arguments}) {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    Modular.to.pop<T?>(result);
  }

  @override
  void popUntil(String routeName) {
    Modular.to.popUntil((route) => route.settings.name == routeName);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, R extends Object?>(
    String routeName, {
    R? result,
    Object? arguments,
  }) => Modular.to.popAndPushNamed<T?, R>(routeName, arguments: arguments);
}
