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
    MyAppRoute.name: (routeData) {
      final args = routeData.argsAs<MyAppRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyAppScreen(
          key: args.key,
          title: args.title,
        ),
      );
    }
  };
}

/// generated route for
/// [MyAppScreen]
class MyAppRoute extends PageRouteInfo<MyAppRouteArgs> {
  MyAppRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          MyAppRoute.name,
          args: MyAppRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyAppRoute';

  static const PageInfo<MyAppRouteArgs> page = PageInfo<MyAppRouteArgs>(name);
}

class MyAppRouteArgs {
  const MyAppRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MyAppRouteArgs{key: $key, title: $title}';
  }
}
