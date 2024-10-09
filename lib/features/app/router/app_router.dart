import 'package:auto_route/auto_route.dart';
import 'package:meezy_starter/features/auth/auth_flow.dart';
import 'package:meezy_starter/features/auth/view/screens/login_screen.dart';
import 'package:meezy_starter/features/auth/view/screens/register_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/splash',
          page: SplashRoute.page,
          type: const RouteType.cupertino(),
        ),
        AutoRoute(
          path: '/session',
          page: SplashRoute.page,
          type: const RouteType.cupertino(),
          children: [
            /// unauthorized zone
            AutoRoute(
              path: '/auth',
              page: AuthFlowRoute.page,
              type: const RouteType.cupertino(),
              children: [
                AutoRoute(
                  path: 'login',
                  page: LoginRoute.page,
                  type: const RouteType.cupertino(),
                ),
                AutoRoute(
                  path: 'register',
                  page: RegisterRoute.page,
                  type: const RouteType.cupertino(),
                ),
              ],
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
          ],
        ),
      ];
}
