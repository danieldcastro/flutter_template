import '../../../../core/foundation/error/failure.dart';
import '../../../../core/foundation/result/result.dart';
import '../../../../core/foundation/usecase/usecase.dart';
import '../entities/post_entity.dart';
import '../params/get_posts_params.dart';
import '../repositories/i_home_repository.dart';

class GetPostsUsecase extends UseCase<GetPostsParams, List<PostEntity>> {
  final IHomeRepository _repository;

  GetPostsUsecase(this._repository);

  @override
  Future<Result<Failure, List<PostEntity>>> call(GetPostsParams params) =>
      _repository.getPosts(params);
}
