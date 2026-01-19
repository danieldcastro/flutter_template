import '../../foundation/contracts/entity_mapper.dart';
import '../../foundation/error/failure.dart';
import '../../foundation/extensions/list_extensions.dart';
import '../../foundation/result/result.dart';
import '../http/models/http_response_model.dart';
import '../http/network/i_request_handler.dart';

abstract class BaseRepository {
  final IRequestHandler handler;

  BaseRepository(this.handler);

  Future<Result<Failure, E>> requestEntity<M extends EntityMapper<E>, E>(
    Future<HttpResponseModel<dynamic>> request, {
    required M Function(Map<String, dynamic> map) fromMap,
    M Function(int statusCode)? fromStatusCode,
  }) async {
    final result = await handler.handleRequest<M>(
      request,
      fromMap: fromMap,
      fromStatusCode: fromStatusCode,
    );

    return result.map((model) => model.toEntity());
  }

  Future<Result<Failure, List<E>>>
  requestEntityList<M extends EntityMapper<E>, E>(
    Future<HttpResponseModel<dynamic>> request, {
    required M Function(Map<String, dynamic> map) fromMap,
  }) async {
    final result = await handler.handleListRequest<M>(request, fromMap);

    return result.map((models) => models.toEntities());
  }
}
