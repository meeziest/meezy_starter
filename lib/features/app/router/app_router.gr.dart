// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthFlow]
class AuthFlowRoute extends PageRouteInfo<void> {
  const AuthFlowRoute({List<PageRouteInfo>? children})
      : super(
          AuthFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthFlowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthFlow();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return LoginScreen();
    },
  );
}

/// generated route for
/// [MainTab]
class MainTabRoute extends PageRouteInfo<void> {
  const MainTabRoute({List<PageRouteInfo>? children})
      : super(
          MainTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return MainTab();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return RegisterScreen();
    },
  );
}

/// generated route for
/// [SessionScope]
class SessionScopeRoute extends PageRouteInfo<void> {
  const SessionScopeRoute({List<PageRouteInfo>? children})
      : super(
          SessionScopeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionScopeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SessionScope());
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return SplashScreen();
    },
  );
}

/// generated route for
/// [UserScope]
class UserScopeRoute extends PageRouteInfo<void> {
  const UserScopeRoute({List<PageRouteInfo>? children})
      : super(
          UserScopeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserScopeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: UserScope());
    },
  );
}
