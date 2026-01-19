import '../../../../core/foundation/contracts/entity_mapper.dart';
import '../../domain/entities/post_entity.dart';

class PostModel implements EntityMapper<PostEntity> {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
    id: map['id'],
    userId: map['userId'],
    title: map['title'],
    body: map['body'],
  );

  @override
  PostEntity toEntity() =>
      PostEntity(id: id, userId: userId, title: title, body: body);
}
