import '../../../../core/config/constants/api/api.path.dart';
import '../../../../core/infra/http/i_http.dart';
import '../../../../core/infra/http/models/http_response_model.dart';
import '../../domain/params/get_posts_params.dart';
import 'i_home_datasource.dart';

class HomeDatasourceImpl implements IHomeDatasource {
  final IHttp _http;

  HomeDatasourceImpl(this._http);

  @override
  Future<HttpResponseModel> getPosts(GetPostsParams params) =>
      _http.get(ApiPath.posts, query: params.toJson());
}
