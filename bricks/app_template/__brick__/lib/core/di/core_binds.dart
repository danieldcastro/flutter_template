import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../infra/http/dio/dio_factory.dart';
import '../infra/http/http_impl.dart';
import '../infra/http/i_http.dart';
import '../infra/log/i_log.dart';
import '../infra/log/log_impl.dart';
import '../infra/navigation/i_nav.dart';
import '../infra/navigation/nav_impl.dart';

class CoreBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addLazySingleton<ILog>(LogImpl.new)
      ..addLazySingleton<Dio>(() => DioFactory.create(
        interceptors: const [],
      ))
      ..addLazySingleton<IHttp>(HttpImpl.new)
      ..addLazySingleton(Connectivity.new)
      ..addLazySingleton<INav>(NavImpl.new)

    super.exportedBinds(i);
  }
}
