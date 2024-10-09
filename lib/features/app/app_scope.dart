import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/config/core_dependencies.dart';
import '../auth/bloc/auth_bloc.dart';
import '../auth/data/data_sources/auth_data_source.dart';
import '../auth/data/repositories/auth_repository.dart';
import 'bloc/app_bloc.dart';

typedef AppBuilder = Widget Function(BuildContext context, AppState);

class AppScope extends StatelessWidget {
  const AppScope({
    required this.builder,
    required this.coreDependencies,
    super.key,
  });

  final CoreDependencies coreDependencies;
  final AppBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// core dependencies
        Provider<AppDependencies>(
          create: (context) => AppDependencies(
            sharedPreferences: coreDependencies.sharedPreferences,
            authClient: coreDependencies.authClient,
            client: coreDependencies.client,
          ),
        ),

        /// data sources
        Provider<AuthDataSource<Object>>(
          create: (context) => AuthDataSourceNetwork(
            client: coreDependencies.client,
          ),
        ),

        /// repositories
        Provider<AuthRepository<Object>>(
          create: (context) => AuthRepositoryImpl(
            dataSource: context.read(),
            storage: coreDependencies.tokenStorage,
          ),
        ),

        /// blocs
        BlocProvider(
          create: coreDependencies.appBlocCreator,
        ),
        BlocProvider(
          create: (context) => AuthBloc(authRepository: context.read()),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, appState) => builder(context, appState),
      ),
    );
  }
}
