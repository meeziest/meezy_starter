import 'dart:async';

import 'package:dio/dio.dart';

import 'package:meezy_core/src/logger/logger.dart';

class GptInterceptor extends QueuedInterceptor {
  final String token;

  GptInterceptor({required this.token});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final headers = {'Authorization': 'Bearer $token'};
      options.headers.addAll(headers);
      handler.next(options);
    } on Object catch (e) {
      logger.warning('ReplicateInterceptor error: $e');
      rethrow;
    }
  }
}
