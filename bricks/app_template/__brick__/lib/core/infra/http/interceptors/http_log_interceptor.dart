import 'package:dio/dio.dart';

import '../../log/i_log.dart';

class HttpLogInterceptor extends Interceptor {
  final ILog log;

  HttpLogInterceptor(this.log);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log
      ..info('➡️ ${options.method} ${options.uri}')
      ..debug('Headers: ${options.headers}')
      ..debug('Query: ${options.queryParameters}')
      ..debug('Body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log
      ..info('✅ ${response.statusCode} ${response.requestOptions.uri}')
      ..debug('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.error('❌ ${err.response?.statusCode} ${err.requestOptions.uri}', err);
    super.onError(err, handler);
  }
}
