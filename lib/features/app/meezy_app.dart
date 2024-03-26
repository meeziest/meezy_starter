import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/app_scope.dart';

import 'presentation/router/app_router.dart';

class MeezyApp extends StatelessWidget {
  const MeezyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return AppScope(
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
