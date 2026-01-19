import 'package:flutter/material.dart';

sealed class UiEffect {
  const UiEffect();
}

class ShowSnackbarEffect extends UiEffect {
  final String message;
  final SnackBarAction? action;

  const ShowSnackbarEffect({required this.message, this.action});
}
