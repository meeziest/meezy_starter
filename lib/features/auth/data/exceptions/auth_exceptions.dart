/// Exception thrown when the authentication fails
base class AuthenticationException implements Exception {
  /// Create a [AuthenticationException]
  const AuthenticationException();
}

/// Exception thrown when the credentials are wrong
final class WrongCredentialsException implements AuthenticationException {
  /// Create a [WrongCredentialsException]
  const WrongCredentialsException();

  /// [10001] is the system error code for wrong credentials
  static const int code = 10001;
}

/// Unknown authentication exception
final class UnknownAuthenticationException implements AuthenticationException {
  /// System error code, that is not understood
  final int? code;

  /// Error message
  final Object error;

  /// Create a [UnknownAuthenticationException]
  const UnknownAuthenticationException({
    required this.error,
    this.code,
  });
}
