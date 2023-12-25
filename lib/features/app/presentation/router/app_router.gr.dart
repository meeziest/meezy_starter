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
    AppScopeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: AppScope()),
      );
    },
    AppRoute.name: (routeData) {
      final args = routeData.argsAs<AppRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
    AuthScopeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: AuthScope()),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [AppScope]
class AppScopeRoute extends PageRouteInfo<void> {
  const AppScopeRoute({List<PageRouteInfo>? children})
      : super(
          AppScopeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppScopeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<AppRouteArgs> {
  AppRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<AppRouteArgs> page = PageInfo<AppRouteArgs>(name);
}

class AppRouteArgs {
  const AppRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key, title: $title}';
  }
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
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, title: $title}';
  }
}
