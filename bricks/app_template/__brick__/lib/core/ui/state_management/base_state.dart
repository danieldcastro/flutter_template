import 'package:equatable/equatable.dart';

import 'failure_state.dart';

abstract class BaseState<S extends BaseState<S>> extends Equatable {
  final bool isLoading;
  final FailureState failure;

  const BaseState({this.isLoading = false, this.failure = const NotFailure()});

  S copyWith({bool? isLoading, FailureState? failure});
}
