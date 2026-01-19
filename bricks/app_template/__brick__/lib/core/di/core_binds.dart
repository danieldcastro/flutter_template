import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../foundation/error/error_mapper_impl.dart';
import '../foundation/error/i_error_mapper.dart';
import '../infra/http/dio/dio_factory.dart';
import '../infra/http/http_impl.dart';
import '../infra/http/i_http.dart';
import '../infra/http/interceptors/http_log_interceptor.dart';
import '../infra/http/network/i_network_status.dart';
import '../infra/http/network/i_request_handler.dart';
import '../infra/http/network/network_checker.dart';
import '../infra/http/network/network_status_impl.dart';
import '../infra/http/network/request_handler_impl.dart';
import '../infra/log/i_log.dart';
import '../infra/log/log_impl.dart';
import '../infra/navigation/i_nav.dart';
import '../infra/navigation/nav_impl.dart';

class CoreBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addLazySingleton<ILog>(LogImpl.new)
      ..addLazySingleton<INav>(NavImpl.new)
      ..addLazySingleton<Connectivity>(Connectivity.new)
      ..addLazySingleton(HttpLogInterceptor.new)
      ..addLazySingleton<Dio>(
        () => DioFactory.create(
          interceptors: [if (kDebugMode) i<HttpLogInterceptor>()],
        ),
      )
      ..addLazySingleton<IErrorMapper>(ErrorMapperImpl.new)
      ..addLazySingleton<IHttp>(HttpImpl.new)
      ..addLazySingleton<INetworkStatus>(NetworkStatusImpl.new)
      ..addLazySingleton(NetworkChecker.new)
      ..addLazySingleton<IRequestHandler>(RequestHandlerImpl.new);

    super.exportedBinds(i);
  }
}
