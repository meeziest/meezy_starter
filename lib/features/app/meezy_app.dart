import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/view/router/app_router.dart';

import '../../core/auth/interceptors/auth_interceptor.dart';
import '../../core/config/core_dependencies.dart';
import 'app_scope.dart';

final _appRouter = AppRouter();

class MeezyApp extends StatelessWidget {
  final InitializationResult result;

  const MeezyApp({required this.result, super.key});

  @override
  Widget build(BuildContext context) => AppScope(
        coreDependencies: result.coreDependencies,
        builder: (context, appState, authState) {
          return MaterialApp.router(
            theme: appState.appTheme?.computeTheme(context),
            routerDelegate: AutoRouterDelegate.declarative(
              _appRouter,
              routes: (_) => [
                switch (authState.status) {
                  AuthenticationStatus.initial => const SplashRoute(),
                  AuthenticationStatus.unauthenticated => const AuthRoute(),
                  AuthenticationStatus.authenticated => const MainTabRoute(),
                } as PageRouteInfo,
              ],
            ),
          );
        },
      );
}
