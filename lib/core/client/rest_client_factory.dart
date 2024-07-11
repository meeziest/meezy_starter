import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meezy_starter/core/client/rest_client_dio.dart';
import 'package:meezy_starter/core/proxy/dio_proxy.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../auth/dto/token.dart';
import '../auth/interceptors/auth_interceptor.dart';
import '../auth/token_local.dart';
import '../auth/token_remote.dart';

abstract class RestClientFactory {
  static Future<RestClientDio> create({
    required RestClientFactorySettings settings,
    required TokenStorage<Token> tokenStorage,
  }) async {
    final regularDio = Dio()..useProxy();
    regularDio.options.connectTimeout = settings.connectTimeout;
    regularDio.options.receiveTimeout = settings.receiveTimeout;

    final regularClient = RestClientDio(
      baseUrl: settings.baseUrl,
      dio: regularDio,
    );

    AuthInterceptor<Token> createAuthInterceptor() => AuthInterceptor(
          storage: tokenStorage,
          refreshClient: JWTAuthorizationClient(regularClient),
          buildHeaders: (tokenPair) => {'Authorization': 'Bearer ${tokenPair.accessToken}'},
        );

    switch (settings.type) {
      case RestClientType.regular:
        return RestClientDio(
          baseUrl: settings.baseUrl,
          dio: regularDio
            ..interceptors.addAll([
              PrettyDioLogger(),
            ]),
        );
      case RestClientType.auth:
        final authDio = Dio()..useProxy();
        authDio.options.connectTimeout = settings.connectTimeout;
        authDio.options.receiveTimeout = settings.receiveTimeout;
        return RestClientDio(
          baseUrl: settings.baseUrl,
          dio: authDio
            ..interceptors.addAll([
              createAuthInterceptor(),
              PrettyDioLogger(),
            ]),
        );
    }
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
