import '../../../../core/ui/state_management/base_state.dart';
import '../../../../core/ui/state_management/failure_state.dart';
import '../../domain/entities/post_entity.dart';

class HomeState extends BaseState<HomeState> {
  final List<PostEntity> posts;

  const HomeState({required this.posts, super.isLoading, super.failure});

  factory HomeState.initial() => const HomeState(posts: []);

  @override
  HomeState copyWith({
    bool? isLoading,
    FailureState? failure,
    List<PostEntity>? posts,
  }) => HomeState(
    isLoading: isLoading ?? this.isLoading,
    failure: failure ?? this.failure,
    posts: posts ?? this.posts,
  );

  @override
  List<Object?> get props => [isLoading, failure, posts];
}
