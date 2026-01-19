import '../../../foundation/error/failure.dart';
import '../../../foundation/error/i_error_mapper.dart';
import '../../../foundation/result/result.dart';
import '../../log/i_log.dart';
import '../i_http.dart';
import '../models/http_response_model.dart';
import 'network_checker.dart';

abstract class IRequestHandler {
  final ILog log;
  final IHttp http;
  final IErrorMapper errorMapper;
  final NetworkChecker networkChecker;

  IRequestHandler(this.log, this.http, this.errorMapper, this.networkChecker);

  Future<Result<Failure, T>> handleRequest<T extends Object>(
    Future<HttpResponseModel<dynamic>> request, {
    T Function(Map<String, dynamic> map)? fromMap,
    T Function(int statusCode)? fromStatusCode,
  });

  Future<Result<Failure, List<T>>> handleListRequest<T extends Object>(
    Future<HttpResponseModel<dynamic>> request,
    T Function(Map<String, dynamic> map) fromMap,
  );
}
