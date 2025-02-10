import '../../client/exceptions/failure.dart';

/// Throw this exception when refresh token fails
class RevokeTokenException implements Failure {
  @override
  final String message;

  /// Create a [RevokeTokenException]
  const RevokeTokenException(this.message);

  @override
  String toString() => 'RevokedTokenException';
}
