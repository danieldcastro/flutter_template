import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';
import 'ui_effect.dart';

class BaseEffectsListener<B extends BaseBloc<dynamic>> extends StatefulWidget {
  final Widget child;

  const BaseEffectsListener({required this.child, super.key});

  @override
  State<BaseEffectsListener<B>> createState() => _BaseEffectsListenerState<B>();
}

class _BaseEffectsListenerState<B extends BaseBloc<dynamic>>
    extends State<BaseEffectsListener<B>> {
  StreamSubscription<UiEffect>? _sub;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sub?.cancel();
    final bloc = context.read<B>();

    _sub = bloc.effects.listen((effect) {
      if (!mounted) return;

      switch (effect) {
        case final ShowSnackbarEffect e:
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(e.message), action: e.action),
            );
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
