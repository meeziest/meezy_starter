import 'dart:async';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../client/rest_client_base.dart';
import 'dto/token.dart';
import 'exceptions/auth_exceptions.dart';

abstract interface class AuthorizationClient<T> {
  FutureOr<bool> isRefreshTokenValid(T token);

  FutureOr<bool> isAccessTokenValid(T token);

  Future<T> refresh(T token);
}

final class JWTAuthorizationClient implements AuthorizationClient<Token> {
  final RestClient _client;

  JWTAuthorizationClient(this._client);

  @override
  FutureOr<bool> isRefreshTokenValid(Token token) {
    final jwt = JWT.decode(token.refreshToken);

    // Check if JWT token is expired
    if (jwt.payload case {'exp': final int exp}) {
      return DateTime.now().isBefore(
        DateTime.fromMillisecondsSinceEpoch(exp),
      );
    }

    return false;
  }

  @override
  FutureOr<bool> isAccessTokenValid(Token token) {
    final jwt = JWT.decode(token.accessToken);

    // Check if JWT token is expired
    if (jwt.payload case {'exp': final int exp}) {
      return DateTime.now().isBefore(
        DateTime.fromMillisecondsSinceEpoch(exp),
      );
    }

    return false;
  }

  @override
  Future<Token> refresh(Token token) async {
    final responseJson = await _client.post(
      '/auth/refresh-token',
      headers: {'Authorization': 'Bearer ${token.accessToken}'},
      body: {},
    );

    if (responseJson
        case {
          'access_token': final String aToken,
          'refresh_token': final String rToken,
        }) {
      return Token(aToken, rToken);
    }

    throw const RevokeTokenException('Invalid token');
  }
}
