import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/core/auth/interceptors/auth_interceptor.dart';
import 'package:meezy_starter/core/auth/token_local.dart';
import 'package:meezy_starter/core/client/rest_client_dio.dart';
import 'package:meezy_starter/features/app/presentation/bloc/app_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/auth/token_remote.dart';
import 'domain/repositories/app_repository.dart';

final baseUrl = 'tyndame.kz.test';

final unAuthDioClient = RestClientDio(baseUrl: baseUrl, dio: Dio());

Future<RestClientDio> get authDioClient async => RestClientDio(
      baseUrl: baseUrl,
      dio: Dio()
        ..interceptors.add(
          AuthInterceptor(
            storage: TokenStorageSP(sharedPreferences: await SharedPreferences.getInstance()),
            refreshClient: JWTAuthorizationClient(unAuthDioClient),
            buildHeaders: (tokenPair) => {'Authorization': 'Bearer ${tokenPair.accessToken}'},
          ),
        ),
    );

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
          child: child,
        ),
      ],
      child: child,
    );
  }
}
