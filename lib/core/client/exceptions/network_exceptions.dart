// ignore_for_file: overridden_fields

import 'package:meta/meta.dart';

/// Base class for all rest client exceptions
@immutable
abstract base class RestClientException implements Exception {
  /// Message of the exception
  final String message;

  /// The status code of the response (if any)
  final int? statusCode;

  /// {@macro network_exception}
  const RestClientException({required this.message, this.statusCode});
}

/// Base class for all rest client exceptions that have a cause
abstract base class RestClientExceptionWithCause extends RestClientException {
  /// {@macro rest_client_exception_with_cause}
  const RestClientExceptionWithCause({
    required super.message,
    required this.cause,
    super.statusCode,
  });

  /// The cause of the exception
  ///
  /// It is the inner exception that caused this exception to be thrown
  final Object? cause;
}

/// [ClientException] is thrown if something went wrong on client side
final class ClientException extends RestClientException {
  /// {@macro client_exception}
  const ClientException({
    required super.message,
    super.statusCode,
    this.cause,
  });

  /// The cause of the exception
  ///
  /// It is the inner exception that caused this exception to be thrown
  final Object? cause;

  @override
  String toString() => 'ClientException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause'
      ')';
}

/// [CustomBackendException] is thrown if the backend returns an error
final class CustomBackendException extends RestClientException {
  /// {@macro custom_backend_exception}
  const CustomBackendException({
    required super.message,
    required this.error,
    super.statusCode,
  });

  /// The error returned by the backend
  final Map<String, Object?> error;

  @override
  String toString() => 'CustomBackendException('
      'message: $message,'
      'error: $error,'
      'statusCode: $statusCode,'
      ')';
}

/// [WrongResponseTypeException] is thrown if the response type
/// is not the expected one
final class WrongResponseTypeException extends RestClientException {
  /// {@macro wrong_response_type_exception}
  const WrongResponseTypeException({
    required super.message,
    super.statusCode,
  });

  @override
  String toString() => 'WrongResponseTypeException('
      'message: $message,'
      'statusCode: $statusCode,'
      ')';
}

/// [ConnectionException] is thrown if there are problems with the connection
final class ConnectionException extends RestClientExceptionWithCause {
  /// {@macro connection_exception}
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() => 'ConnectionException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause'
      ')';
}

/// If something went wrong on the server side
final class InternalServerException extends RestClientExceptionWithCause {
  /// {@macro internal_server_exception}
  const InternalServerException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() => 'InternalServerException('
      'message: $message,'
      'statusCode: $statusCode,'
      'cause: $cause'
      ')';
}
