import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/features/auth/presentation/bloc/auth_bloc.dart';

import 'domain/repositories/auth_repository.dart';

@RoutePage(name: 'AuthScopeRoute')
class AuthScope extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        /// repositories
        RepositoryProvider(create: (context) => AuthRepository1()),
        RepositoryProvider(create: (context) => AuthRepository2()),
        RepositoryProvider(create: (context) => AuthRepository3()),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          context.read(),
          context.read(),
          context.read(),
        ),
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AutoRouter();
}
