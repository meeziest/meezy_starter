import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// unauthorized zone
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
          type: const RouteType.cupertino(),
        ),
        AutoRoute(
          path: '/splash',
          page: SplashRoute.page,
          type: const RouteType.cupertino(),
        ),

        /// authorized zone
        AutoRoute(
          path: '/user',
          page: UserScopeRoute.page,
          children: [
            AutoRoute(
              path: 'main',
              page: MainTabRoute.page,
              type: const RouteType.cupertino(),
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileTabRoute.page,
              type: const RouteType.cupertino(),
            ),
          ],
        )
      ];
}
