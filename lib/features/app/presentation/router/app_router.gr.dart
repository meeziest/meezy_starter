// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppScreen(),
      );
    },
    AuthScopeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: AuthScope()),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthScope]
class AuthScopeRoute extends PageRouteInfo<void> {
  const AuthScopeRoute({List<PageRouteInfo>? children})
      : super(
          AuthScopeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthScopeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, title: $title}';
  }
}
