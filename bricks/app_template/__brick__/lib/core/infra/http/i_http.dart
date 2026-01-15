import 'models/http_response_model.dart';

typedef JsonParser<T> = T Function(Object? json);

abstract class IHttp {
  Future<HttpResponseModel<T>> get<T>(
    Uri uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  });

  Future<HttpResponseModel<T>> post<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  });

  Future<HttpResponseModel<T>> put<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  });

  Future<HttpResponseModel<T>> patch<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  });

  Future<HttpResponseModel<T>> delete<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  });
}
