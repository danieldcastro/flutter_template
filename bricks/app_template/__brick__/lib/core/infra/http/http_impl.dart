import 'package:dio/dio.dart';

import 'i_http.dart';
import 'models/http_response_model.dart';
import 'multipart/multipart_body.dart';

class HttpImpl implements IHttp {
  final Dio _dio;

  HttpImpl(this._dio);

  @override
  Future<HttpResponseModel<T>> get<T>(
    Uri uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  }) async {
    try {
      final r = await _dio.get(
        uri.path,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _ok<T>(r, parser);
    } on DioException catch (e) {
      return _err<T>(e);
    }
  }

  @override
  Future<HttpResponseModel<T>> post<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  }) async {
    try {
      final r = await _dio.post(
        uri.toString(),
        data: _adaptBody(body),
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _ok<T>(r, parser);
    } on DioException catch (e) {
      return _err<T>(e);
    }
  }

  @override
  Future<HttpResponseModel<T>> put<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  }) async {
    try {
      final r = await _dio.put(
        uri.toString(),
        data: _adaptBody(body),
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _ok<T>(r, parser);
    } on DioException catch (e) {
      return _err<T>(e);
    }
  }

  @override
  Future<HttpResponseModel<T>> patch<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  }) async {
    try {
      final r = await _dio.patch(
        uri.toString(),
        data: _adaptBody(body),
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _ok<T>(r, parser);
    } on DioException catch (e) {
      return _err<T>(e);
    }
  }

  @override
  Future<HttpResponseModel<T>> delete<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    JsonParser<T>? parser,
  }) async {
    try {
      final r = await _dio.delete(
        uri.toString(),
        data: _adaptBody(body),
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _ok<T>(r, parser);
    } on DioException catch (e) {
      return _err<T>(e);
    }
  }

  HttpResponseModel<T> _ok<T>(Response r, JsonParser<T>? parser) {
    final raw = r.data;
    final parsed = parser != null ? parser(raw) : (raw is T ? raw : null);

    return HttpResponseModel<T>(
      statusCode: r.statusCode ?? 0,
      data: parsed,
      raw: raw,
    );
  }

  HttpResponseModel<T> _err<T>(DioException e) => HttpResponseModel<T>(
    statusCode: e.response?.statusCode ?? 0,
    raw: e.response?.data ?? e,
  );

  Object? _adaptBody(Object? body) {
    if (body is MultipartBody) return _toFormData(body);
    return body;
  }

  FormData _toFormData(MultipartBody body) {
    final form = FormData();

    body.fields.forEach((k, v) {
      form.fields.add(MapEntry(k, v));
    });

    for (final f in body.files) {
      form.files.add(
        MapEntry(
          f.field,
          MultipartFile.fromBytes(f.bytes, filename: f.filename),
        ),
      );
    }

    return form;
  }
}
