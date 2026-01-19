import '../../../foundation/error/app_exception.dart';
import '../../../foundation/error/failure.dart';
import '../../../foundation/extensions/list_extensions.dart';
import '../../../foundation/result/result.dart';
import '../models/http_response_model.dart';
import 'i_request_handler.dart';

class RequestHandlerImpl extends IRequestHandler {
  RequestHandlerImpl(
    super.log,
    super.http,
    super.errorMapper,
    super.networkChecker,
  );

  void _ensureSuccess<T>(HttpResponseModel<T> response) {
    if (response.isOk) return;

    throw errorMapper.fromResponse(
      statusCode: response.statusCode,
      message: response.message,
      details: response.data,
    );
  }

  Map<String, dynamic> _ensureMap(value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);

    throw AppException(
      'Dados não estão em formato de Map<String, dynamic>',
      code: 'INVALID_MAP',
      details: value,
    );
  }

  List _ensureList(value) {
    if (value is List) return value;

    throw AppException(
      'Dados não estão em formato de List',
      code: 'INVALID_LIST',
      details: value,
    );
  }

  Future<Result<Failure, T>> _handleCatch<T>(
    Object error,
    StackTrace st,
  ) async {
    log.error('Request error: $error');

    var failure = errorMapper.map(error, st);

    // ✅ Opção B: só valida internet real quando o erro parece rede/timeout
    if (failure.type == FailureType.network ||
        failure.type == FailureType.timeout) {
      final hasInternet = await networkChecker.hasInternetAccess();
      if (!hasInternet) {
        failure = Failure(
          type: FailureType.network,
          message: 'Sem internet.',
          code: failure.code,
          details: failure.details ?? error,
        );
      }
    }

    return Left(failure);
  }

  @override
  Future<Result<Failure, T>> handleRequest<T extends Object>(
    Future<HttpResponseModel<dynamic>> request, {
    T Function(Map<String, dynamic> map)? fromMap,
    T Function(int statusCode)? fromStatusCode,
  }) async {
    assert(
      !(fromMap != null && fromStatusCode != null),
      'fromMap and fromStatusCode cannot be used together.',
    );
    assert(
      !(fromMap == null && fromStatusCode == null),
      'Either fromMap or fromStatusCode must be provided.',
    );

    // ✅ Check rápido (barato) via NetworkChecker
    if (!await networkChecker.hasAnyNetwork()) {
      return const Left(
        Failure(type: FailureType.network, message: 'Sem conexão.'),
      );
    }

    try {
      final result = await request;

      _ensureSuccess(result);

      if (fromStatusCode != null) {
        final sc = result.statusCode;
        return Right(fromStatusCode(sc));
      }

      final data = result.data;

      if (fromMap != null) {
        if (data is String) {
          return Right(fromMap({'data': data}));
        }
        return Right(fromMap(_ensureMap(data)));
      }

      return const Left(
        Failure(
          type: FailureType.unknown,
          message: 'Configuração inválida de parser.',
        ),
      );
    } catch (e, st) {
      return _handleCatch<T>(e, st);
    }
  }

  @override
  Future<Result<Failure, List<T>>> handleListRequest<T extends Object>(
    Future<HttpResponseModel<dynamic>> request,
    T Function(Map<String, dynamic> map) fromMap,
  ) async {
    if (!await networkChecker.hasAnyNetwork()) {
      return const Left(
        Failure(type: FailureType.network, message: 'Sem conexão.'),
      );
    }

    try {
      final result = await request;

      _ensureSuccess(result);

      final list = _ensureList(result.data);
      final mapped = list.deserializeList(fromMap);

      return Right(mapped);
    } catch (e, st) {
      return _handleCatch<List<T>>(e, st);
    }
  }
}
