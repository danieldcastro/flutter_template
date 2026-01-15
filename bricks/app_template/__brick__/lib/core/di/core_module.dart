import 'package:flutter_modular/flutter_modular.dart';

import 'core_binds.dart';

class CoreModule extends Module {
  @override
  List<Module> get imports => [CoreBinds()];
}
