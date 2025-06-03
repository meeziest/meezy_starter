import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meezy_core/src/client/rest_client_dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../auth/dto/token.dart';
import '../auth/interceptors/auth_interceptor.dart';
import '../auth/token_local.dart';
import '../auth/token_remote.dart';
import 'interceptors/gpt_interceptor.dart';

enum RestClientType { auth, regular, genAi, gpt }

abstract class RestClientFactory {
  static Future<RestClientDio> create({
    required RestClientFactorySettings settings,
    required TokenStorage<Token> tokenStorage,
  }) async {
    final regularDio = Dio();
    regularDio.options.connectTimeout = settings.connectTimeout;
    regularDio.options.receiveTimeout = settings.receiveTimeout;

    final refreshClient = RestClientDio(
      baseUrl: settings.baseUrl,
      dio: regularDio,
    );

    AuthInterceptor<Token> createAuthInterceptor() => AuthInterceptor(
          storage: tokenStorage,
          refreshClient: JWTAuthorizationClient(refreshClient),
          buildHeaders: (tokenPair) => {'Authorization': 'Bearer ${tokenPair.accessToken}'},
        );

    RestClientDio regularClient() {
      return RestClientDio(
        baseUrl: settings.baseUrl,
        dio: regularDio..interceptors.addAll([PrettyDioLogger()]),
      );
    }

    RestClientDio authClient() {
      final authDio = Dio();
      authDio.options.connectTimeout = settings.connectTimeout;
      authDio.options.receiveTimeout = settings.receiveTimeout;
      return RestClientDio(
        baseUrl: settings.baseUrl,
        dio: authDio..interceptors.addAll([createAuthInterceptor(), PrettyDioLogger()]),
      );
    }

    RestClientDio genAiClient() {
      final genAiDio = Dio();
      genAiDio.options.connectTimeout = const Duration(seconds: 50);
      genAiDio.options.receiveTimeout = const Duration(seconds: 50);
      return RestClientDio(
        baseUrl: settings.baseUrl,
        dio: genAiDio
          ..interceptors.addAll([
            GptInterceptor(
              token: const String.fromEnvironment("REPLICATE_API_KEY"),
            ),
            PrettyDioLogger()
          ]),
      );
    }

    RestClientDio gptClient() {
      final gptDio = Dio();
      gptDio.options.connectTimeout = const Duration(seconds: 50);
      gptDio.options.receiveTimeout = const Duration(seconds: 50);
      return RestClientDio(
        baseUrl: settings.baseUrl,
        dio: gptDio
          ..interceptors.addAll([
            GptInterceptor(
              token: const String.fromEnvironment("OPENROUTER_API_KEY"),
            ),
            PrettyDioLogger()
          ]),
      );
    }

    return switch (settings.type) {
      RestClientType.auth => authClient(),
      RestClientType.regular => regularClient(),
      RestClientType.genAi => genAiClient(),
      RestClientType.gpt => gptClient(),
    };
  }
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
