import '../../../../core/ui/state_management/base_bloc.dart';
import '../../../../core/ui/state_management/failure_state.dart';
import '../../domain/params/get_posts_params.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final GetPostsUsecase _getPostsUsecase;

  HomeBloc(this._getPostsUsecase) : super(HomeState.initial());

  Future<void> getPosts() async {
    final params = GetPostsParams(userId: 4);

    updateLoading(true);
    final result = await _getPostsUsecase(params);
    updateLoading(false);

    result.fold(
      (left) => handleFailureFrom(
        FailureState.of(left.message, action: getPosts),
        asSnackbar: false,
      ),
      (right) => handleSuccess(() => emit(state.copyWith(posts: right))),
    );
  }
}
