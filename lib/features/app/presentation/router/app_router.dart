import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/features/auth/presentation/router/auth_router.dart';

import '../../../auth/auth_scope.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/screens/register_screen.dart';
import '../screens/app_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/app',
          initial: true,
          page: AppRoute.page,
        ),
        ...AuthRouter.routes,
      ];
}
