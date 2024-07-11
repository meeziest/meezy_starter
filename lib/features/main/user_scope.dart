import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/user_bloc.dart';

@RoutePage(name: 'UserScopeRoute')
class UserScope extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) => child,
      routes: const [
        /// tabs
      ],
    );
  }
}
