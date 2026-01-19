import 'package:dio/dio.dart';

import '../../../config/flavors/flavors.dart';

class DioFactory {
  DioFactory._();

  static Dio create({
    List<Interceptor>? interceptors,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 60),
    Duration sendTimeout = const Duration(seconds: 60),
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        baseUrl: Flavors.baseUrl,
      ),
    );
    if (interceptors != null) dio.interceptors.addAll(interceptors);

    return dio;
  }
}
