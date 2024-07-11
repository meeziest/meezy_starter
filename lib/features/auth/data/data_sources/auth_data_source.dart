import '../../../../core/auth/dto/token.dart';
import '../../../../core/client/rest_client_base.dart';
import '../exceptions/auth_exceptions.dart';

/// Data source for authentication
abstract interface class AuthDataSource<T> {
  /// Sign in with email and password
  Future<T> signIn(String email, String password);

  /// Sign in with email and password
  Future<void> signUp(String email, String password);
}

/// Auth data source that interacts with the backend
/// and interprets the response as [Token] or throws [AuthenticationException]
final class AuthDataSourceNetwork implements AuthDataSource<Token> {
  final RestClient _client;

  /// Create an [AuthDataSourceNetwork]
  const AuthDataSourceNetwork({required RestClient client}) : _client = client;

  @override
  Future<Token> signIn(
    String email,
    String password,
  ) async {
    final responseBody = await _client.post(
      'auth/authorization',
      body: {
        'username': email,
        'password': password,
      },
    );

    // Check if the response is an error
    if (responseBody
        case {
          'error': {
            // optional message provided by the server
            'message': final String message,
            // system error code
            'code': final int code,
          }
        }) {
      throw switch (code) {
        WrongCredentialsException.code => const WrongCredentialsException(),
        _ => UnknownAuthenticationException(code: code, error: message)
      };
    }

    // Check if response contains access_token and refresh_token
    if (responseBody
        case {
          'jwt-access-token': final String accessToken,
          'jwt-refresh-token': final String refreshToken,
        }) {
      return Token(accessToken, refreshToken);
    }

    // If we can't understand the response, throw a format exception
    throw FormatException(
      'Returned response is not understood by the application',
      responseBody,
    );
  }

  @override
  Future<void> signUp(String email, String password) async {
    final responseBody = await _client.post(
      'auth/registration',
      body: {
        'username': email,
        'password': password,
      },
    );

    // Check if the response is an error
    if (responseBody
        case {
          'error': {
            // optional message provided by the server
            'message': final String message,
            // system error code
            'code': final int code,
          }
        }) {
      throw switch (code) {
        WrongCredentialsException.code => const WrongCredentialsException(),
        _ => UnknownAuthenticationException(code: code, error: message)
      };
    }
  }
}
