import 'dart:ui';

sealed class FailureState {
  const FailureState();

  static const NotFailure none = NotFailure();

  static FailureInfo of(
    String message, {
    String? actionTitle,
    VoidCallback? action,
  }) => FailureInfo(error: message, actionTitle: actionTitle, action: action);
}

class NotFailure extends FailureState {
  const NotFailure();
}

class FailureInfo extends FailureState {
  final String error;
  final String? actionTitle;
  final VoidCallback? action;

  const FailureInfo({required this.error, this.actionTitle, this.action});

  @override
  String toString() => error;
}
