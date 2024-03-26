import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/features/app/presentation/bloc/app_bloc.dart';
import 'package:provider/provider.dart';

import 'domain/repositories/app_repository.dart';

class AppScope extends StatelessWidget {
  const AppScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// repositories
        Provider(create: (context) => AppRepository1()),
        Provider(create: (context) => AppRepository2()),
        Provider(create: (context) => AppRepository3()),

        /// bloc
        BlocProvider(
          create: (context) => AppBloc(
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
