import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../../../config/flavors/flavors.dart';

class DioFactory {
  DioFactory._();

  static Dio create({
    required List<Interceptor> interceptors,
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

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
