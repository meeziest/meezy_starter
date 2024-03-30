/// Throw this exception when refresh token fails
class RevokeTokenException implements Exception {
  final String message;

  /// Create a [RevokeTokenException]
  const RevokeTokenException(this.message);

  @override
  String toString() => 'RevokedTokenException';
}
