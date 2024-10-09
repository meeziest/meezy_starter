import 'dart:async';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../logger/logger.dart';
import '../exceptions/auth_exceptions.dart';
import '../token_local.dart';
import '../token_remote.dart';

/// [SessionStatus] is used to determine the authentication state
/// of the user.
///
/// This should be consumed by the business logic.
enum SessionStatus {
  /// The user is authenticated
  authenticated,

  /// The user is unauthenticated
  unauthenticated;
}

/// AuthSource provides valuable information about the authentication state
abstract interface class AuthStatusDataSource {
  /// Stream of token pairs
  ///
  /// This stream should be listened from repository and bloc,
  /// if it emits null, it means the token pair is revoked
  /// and the user should be logged out.
  Stream<SessionStatus> getAuthenticationStatusStream();
}

/// Interceptor for Auth
///
/// This interceptor adds the Auth token to the request header
/// and clears the token if the request fails with a 401
class AuthInterceptor<T> extends QueuedInterceptor {
  /// Create an Auth interceptor
  AuthInterceptor({
    required this.storage,
    required this.refreshClient,
    required this.buildHeaders,
    @visibleForTesting Dio? retryClient,
  }) : retryClient = retryClient ?? Dio() {
    _storageSubscription = storage.stream.listen(
      (token) => _token = token,
    );
  }

  /// [Dio] client used to retry the request.
  final Dio retryClient;

  /// The token storage
  ///
  /// This is used to store and retrieve the Auth token.
  final TokenStorage<T> storage;

  /// Refresh client that refreshes the Auth token pair
  ///
  /// This is used to refresh the Auth token
  /// pair when the request fails with a 401.
  final AuthorizationClient<T> refreshClient;

  /// Async cache that ensures that only one request is made to the storage
  /// simultaneously.
  final AsyncCache<T?> _tokenCache = AsyncCache.ephemeral();

  StreamSubscription<T?>? _storageSubscription;

  /// The current token model
  T? _token;

  /// Get the token pair
  ///
  /// Returns the cached token pair if it exists,
  /// otherwise loads from the storage.
  Future<T?> getTokenPair() {
    if (_token != null) {
      return Future.value(_token);
    }

    return _tokenCache.fetch(
      () async => _token = await storage.load(),
    );
  }

  /// Clear the token pair
  /// Invalidates cache and clears storage
  @visibleForTesting
  Future<void> clearTokenPair() => storage.clear();

  /// Save the token pair
  /// Invalidates cache and saves to storage
  @visibleForTesting
  Future<void> saveTokenPair(T pair) => storage.save(pair);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Load the token pair
      final tokenPair = await getTokenPair();

      // Build the headers based on the token pair
      final headers = tokenPair != null ? buildHeaders(tokenPair) : const <String, String>{};

      // Add the headers to the request
      options.headers.addAll(headers);

      // Continue the request
      handler.next(options);
    } on Object catch (e) {
      logger.warning('Clearing token pair due to error: $e');

      // We don't create a new exception here, just rethrow the original
      rethrow;
    }
  }

  @override
  Future<void> onResponse(
    Response<Object?> response,
    ResponseInterceptorHandler handler,
  ) async {
    final token = await getTokenPair();

    if (token == null || !shouldRefresh(response)) {
      return handler.next(response);
    }

    final newResponse = await _refresh(response, token);
    handler.resolve(newResponse);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final token = await getTokenPair();
    if (response == null || token == null || err.error is RevokeTokenException || !shouldRefresh(response)) {
      return handler.next(err);
    }

    try {
      final refreshResponse = await _refresh(response, token);
      handler.resolve(refreshResponse);
    } on DioException catch (error) {
      handler.next(error);
    }
  }

  // coverage:ignore-start
  /// Close the interceptor
  Future<void> close() async {
    await _storageSubscription?.cancel();
  }
  // coverage:ignore-end

  /// Build the headers
  ///
  /// This is used to build the headers for the request.
  @visibleForTesting
  @pragma('vm:prefer-inline')
  final Map<String, String> Function(T token) buildHeaders;

  /// Check if the token pair should be refreshed
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R> response) => response.statusCode == 401;

  Future<Response<R>> _refresh<R>(Response<R> response, T token) async {
    final T newTokenPair;

    try {
      // Refresh the token pair
      newTokenPair = await refreshClient.refresh(token);
    } on RevokeTokenException {
      // Clear the token pair
      logger.info('Revoking token pair');
      await clearTokenPair();
      rethrow;
    } on Object catch (_) {
      rethrow;
    }

    // Save the new token pair
    await saveTokenPair(newTokenPair);

    final headers = buildHeaders(newTokenPair);

    // Retry the request
    final newResponse = await retryRequest<R>(response, headers);

    return newResponse;
  }

  /// Retry the request
  @visibleForTesting
  Future<Response<R>> retryRequest<R>(
    Response<R> response,
    Map<String, String> headers,
  ) =>
      retryClient.request<R>(
        response.requestOptions.path,
        cancelToken: response.requestOptions.cancelToken,
        data: response.requestOptions.data,
        onReceiveProgress: response.requestOptions.onReceiveProgress,
        onSendProgress: response.requestOptions.onSendProgress,
        queryParameters: response.requestOptions.queryParameters,
        options: Options(
          method: response.requestOptions.method,
          sendTimeout: response.requestOptions.sendTimeout,
          receiveTimeout: response.requestOptions.receiveTimeout,
          extra: response.requestOptions.extra,
          headers: response.requestOptions.headers..addAll(headers),
          responseType: response.requestOptions.responseType,
          contentType: response.requestOptions.contentType,
          validateStatus: response.requestOptions.validateStatus,
          receiveDataWhenStatusError: response.requestOptions.receiveDataWhenStatusError,
          followRedirects: response.requestOptions.followRedirects,
          maxRedirects: response.requestOptions.maxRedirects,
          requestEncoder: response.requestOptions.requestEncoder,
          responseDecoder: response.requestOptions.responseDecoder,
          listFormat: response.requestOptions.listFormat,
        ),
      );
}
