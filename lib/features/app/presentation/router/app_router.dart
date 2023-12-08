import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/presentation/app_screen.dart';

import '../../../../core/router/base_router.dart';
import '../../app_dependencies.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/app',
          page: MyAppRoute.page,
          meta: {DEPENDENCIES_TAG: AppDependencies()..prepare()},
          children: [],
        ),
      ];
}
