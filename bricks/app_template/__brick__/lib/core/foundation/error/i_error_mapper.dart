import 'failure.dart';

abstract class IErrorMapper {
  Failure map(Object error, [StackTrace? stackTrace]);

  Failure fromResponse({
    required int? statusCode,
    required String? message,
    String? code,
    Object? details,
  });
}
