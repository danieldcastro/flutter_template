import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'base_state.dart';
import 'failure_state.dart';
import 'ui_effect.dart';

abstract class BaseBloc<S extends BaseState<S>> extends Cubit<S> {
  BaseBloc(super.initialState);

  final _effects = StreamController<UiEffect>.broadcast();
  Stream<UiEffect> get effects => _effects.stream;

  void emitEffect(UiEffect effect) => _effects.add(effect);

  @override
  Future<void> close() async {
    await _effects.close();
    return super.close();
  }

  void updateFailure(FailureState failure) {
    emit(state.copyWith(failure: failure));
  }

  void updateLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  bool handleSuccess([VoidCallback? onSuccess]) {
    if (state.failure is FailureInfo) {
      updateFailure(const NotFailure());
    }
    onSuccess?.call();
    return true;
  }

  bool handleFailureFrom(FailureInfo failureInfo, {bool asSnackbar = true}) {
    if (asSnackbar) {
      emitEffect(ShowSnackbarEffect(message: failureInfo.error));
      return false;
    }

    updateFailure(failureInfo);
    return false;
  }
}
