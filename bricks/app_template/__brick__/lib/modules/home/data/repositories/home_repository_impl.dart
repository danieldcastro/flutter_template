import '../../../../core/foundation/error/failure.dart';
import '../../../../core/foundation/result/result.dart';
import '../../../../core/infra/repositories/base_repository.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/params/get_posts_params.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/i_home_datasource.dart';
import '../models/post_model.dart';

class HomeRepositoryImpl extends BaseRepository implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepositoryImpl(this._datasource, super.handler);

  @override
  Future<Result<Failure, List<PostEntity>>> getPosts(GetPostsParams params) =>
      requestEntityList<PostModel, PostEntity>(
        _datasource.getPosts(params),
        fromMap: PostModel.fromMap,
      );
}
