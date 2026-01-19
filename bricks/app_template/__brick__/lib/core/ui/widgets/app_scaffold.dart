import 'package:flutter/material.dart';

import '../state_management/failure_state.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool isLoading;
  final FailureState? failure;
  final String title;

  const AppScaffold({
    required this.body,
    required this.title,
    super.key,
    this.isLoading = false,
    this.failure,
  });

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (failure case final FailureInfo info) {
      final hasAction = info.action != null;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(info.error),
            if (hasAction)
              TextButton(
                onPressed: info.action,
                child: Text(info.actionTitle ?? 'Tentar novamente'),
              ),
          ],
        ),
      );
    }
    return body;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: _buildBody(),
  );
}
