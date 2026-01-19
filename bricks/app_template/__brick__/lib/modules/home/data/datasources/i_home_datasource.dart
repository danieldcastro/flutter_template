import '../../../../core/infra/http/models/http_response_model.dart';
import '../../domain/params/get_posts_params.dart';

abstract class IHomeDatasource {
  Future<HttpResponseModel> getPosts(GetPostsParams params);
}
