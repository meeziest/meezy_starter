import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/presentation/app_screen.dart';

import '../../../auth/presentation/auth_scope.dart';
import '../../../auth/presentation/auth_screen.dart';
import '../../../auth/presentation/router/auth_router.dart';
import '../app_scope.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/app',
          page: AppScopeRoute.page,
          children: [
            ...AuthRouter.routes,
          ],
        ),
      ];
}
