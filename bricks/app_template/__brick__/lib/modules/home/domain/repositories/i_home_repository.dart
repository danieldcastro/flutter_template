import '../../../../core/foundation/error/failure.dart';
import '../../../../core/foundation/result/result.dart';
import '../entities/post_entity.dart';
import '../params/get_posts_params.dart';

abstract class IHomeRepository {
  Future<Result<Failure, List<PostEntity>>> getPosts(GetPostsParams params);
}
