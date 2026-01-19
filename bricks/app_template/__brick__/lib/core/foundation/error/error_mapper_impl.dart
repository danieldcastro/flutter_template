import 'dart:async';
import 'dart:io';

import 'app_exception.dart';
import 'failure.dart';
import 'i_error_mapper.dart';

class ErrorMapperImpl implements IErrorMapper {
  @override
  Failure map(Object error, [StackTrace? stackTrace]) {
    if (error is Failure) return error;

    if (error is TimeoutException) {
      return const Failure(
        type: FailureType.timeout,
        message: 'A requisição demorou demais. Tenta de novo.',
      );
    }

    if (error is SocketException) {
      return const Failure(
        type: FailureType.network,
        message: 'Sem conexão com a internet.',
      );
    }

    if (error is AppException) {
      return Failure(
        type: FailureType.unknown,
        message: error.message,
        code: error.code,
        details: error.details,
      );
    }

    return Failure(
      type: FailureType.unknown,
      message: 'Algo deu ruim do nada. 😵',
      details: error,
    );
  }

  @override
  Failure fromResponse({
    required int? statusCode,
    required String? message,
    String? code,
    Object? details,
  }) {
    final normalizedMessage = (message != null && message.trim().isNotEmpty)
        ? message.trim()
        : null;

    return _fromStatusCode(
      statusCode,
      message: normalizedMessage,
      code: code,
      details: details,
    );
  }

  Failure _fromStatusCode(
    int? statusCode, {
    String? message,
    String? code,
    Object? details,
  }) {
    final sc = statusCode ?? 0;

    if (sc == 401) {
      return Failure(
        type: FailureType.unauthorized,
        message: message ?? 'Sessão expirada. Faça login de novo.',
        code: code,
        details: details,
      );
    }
    if (sc == 403) {
      return Failure(
        type: FailureType.forbidden,
        message: message ?? 'Você não tem permissão pra isso.',
        code: code,
        details: details,
      );
    }
    if (sc == 404) {
      return Failure(
        type: FailureType.notFound,
        message: message ?? 'Não achei esse recurso.',
        code: code,
        details: details,
      );
    }
    if (sc == 422) {
      return Failure(
        type: FailureType.validation,
        message: message ?? 'Dados inválidos.',
        code: code,
        details: details,
      );
    }
    if (sc >= 500 && sc <= 599) {
      return Failure(
        type: FailureType.server,
        message: message ?? 'Servidor caiu de boca no asfalto.',
        code: code,
        details: details,
      );
    }
    if (sc == 0) {
      return Failure(
        type: FailureType.unknown,
        message: message ?? 'Resposta inválida.',
        code: code,
        details: details,
      );
    }

    return Failure(
      type: FailureType.unknown,
      message: message ?? 'Erro inesperado.',
      code: code,
      details: details,
    );
  }
}
