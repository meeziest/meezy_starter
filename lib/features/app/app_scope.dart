import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/features/app/presentation/bloc/app_bloc.dart';

import 'domain/repositories/app_repository.dart';

class AppScope extends StatelessWidget {
  const AppScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        /// repositories
        RepositoryProvider(create: (context) => AppRepository1()),
        RepositoryProvider(create: (context) => AppRepository2()),
        RepositoryProvider(create: (context) => AppRepository3()),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          context.read(),
          context.read(),
          context.read(),
        ),
        child: child,
      ),
    );
  }
}
