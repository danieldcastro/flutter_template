enum FailureType {
  network,
  unauthorized,
  forbidden,
  notFound,
  validation,
  timeout,
  server,
  unknown,
}

class Failure {
  const Failure({
    required this.type,
    required this.message,
    this.code,
    this.details,
  });

  final FailureType type;
  final String message;
  final String? code;
  final Object? details;

  @override
  String toString() => 'Failure($type, $message, code: $code)';
}
