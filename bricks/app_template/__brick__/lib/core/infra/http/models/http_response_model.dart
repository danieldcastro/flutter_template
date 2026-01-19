class HttpResponseModel<T> {
  const HttpResponseModel({
    required this.statusCode,
    this.data,
    this.headers = const {},
    this.message,
    this.raw,
  });

  final int statusCode;
  final T? data;

  /// headers normalizados (se precisar)
  final Map<String, String> headers;

  /// mensagem opcional (pode vir do servidor ou do client)
  final String? message;

  /// corpo bruto (json/map/string) pra debug/log
  final Object? raw;

  bool get isOk => statusCode >= 200 && statusCode < 300;

  HttpResponseModel<T> copyWith({
    int? statusCode,
    T? data,
    Map<String, String>? headers,
    String? message,
    Object? raw,
  }) => HttpResponseModel<T>(
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      message: message ?? this.message,
      raw: raw ?? this.raw,
    );
}
