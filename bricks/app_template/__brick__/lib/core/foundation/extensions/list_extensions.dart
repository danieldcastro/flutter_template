import '../contracts/entity_mapper.dart';

extension MapperListX<T extends EntityMapper<E>, E> on List<T> {
  List<E> toEntities() => map((e) => e.toEntity()).toList();
}

extension ListExtensions on List {
  List<T> deserializeList<T>(T Function(Map<String, dynamic>) fromMap) =>
      List.castFrom<dynamic, Map<String, dynamic>>(this).map(fromMap).toList();
}
