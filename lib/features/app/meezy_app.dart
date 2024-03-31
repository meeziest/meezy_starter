import 'package:flutter/material.dart';
import 'package:meezy_starter/core/config/core_dependencies.dart';
import 'package:meezy_starter/features/app/app_scope.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'presentation/router/app_router.dart';

class MeezyApp extends StatelessWidget {
  final InitializationResult result;

  const MeezyApp({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: AppScope(
        coreDependencies: result.coreDependencies,
        child: MaterialApp.router(
          routerConfig: AppRouter().config(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
