import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/router/app_router.dart';

import '../../core/config/core_dependencies.dart';
import 'app_scope.dart';

final _appRouter = AppRouter();

class MeezyApp extends StatelessWidget {
  final InitializationResult result;

  const MeezyApp({required this.result, super.key});

  @override
  Widget build(BuildContext context) => AppScope(
        coreDependencies: result.coreDependencies,
        builder: (context, appState) {
          return MaterialApp.router(
            theme: appState.appTheme?.computeTheme(context),
            routerConfig: _appRouter.config(),
          );
        },
      );
}
