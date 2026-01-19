import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'base_bloc.dart';
import 'base_effects_listener.dart';
import 'base_state.dart';

class BlocView<B extends BaseBloc<S>, S extends BaseState<S>>
    extends StatelessWidget {
  final Widget Function(BuildContext context, S state) builder;

  const BlocView({required this.builder, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<B>(
    create: (_) => Modular.get<B>(),
    child: BaseEffectsListener<B>(child: BlocBuilder<B, S>(builder: builder)),
  );
}
