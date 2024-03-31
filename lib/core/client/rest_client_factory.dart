import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meezy_starter/core/client/rest_client_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/interceptors/auth_interceptor.dart';
import '../auth/token_local.dart';
import '../auth/token_remote.dart';

abstract class RestClientFactory {
  static FutureOr<RestClientDio> create(RestClientFactorySettings settings,
      [SharedPreferences? sharedPreferences]) async {
    final dio = Dio();
    final prefs = sharedPreferences ?? await SharedPreferences.getInstance();
    dio.options.connectTimeout = settings.connectTimeout;
    dio.options.receiveTimeout = settings.receiveTimeout;

    final regularClient = RestClientDio(baseUrl: settings.baseUrl, dio: Dio());

    createAuthInterceptor() async => AuthInterceptor(
          storage: TokenStorageSP(sharedPreferences: prefs),
          refreshClient: JWTAuthorizationClient(regularClient),
          buildHeaders: (tokenPair) => {'Authorization': 'Bearer ${tokenPair.accessToken}'},
        );

    return switch (settings.type) {
      RestClientType.regular => regularClient,
      RestClientType.auth => RestClientDio(
          baseUrl: settings.baseUrl,
          dio: dio..interceptors.add(await createAuthInterceptor()),
        ),
    };
  }
}

enum RestClientType {
  auth,
  regular,
}

class RestClientFactorySettings {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final RestClientType type;

  RestClientFactorySettings(
    this.baseUrl,
    this.type, {
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
  });
}
