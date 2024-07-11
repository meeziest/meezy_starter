import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

/// Extension methods to apply HTTP proxy to Dio client.
///
/// This extension provides a method to configure Dio to use an HTTP proxy
/// based on environment settings.
extension DioProxyExtension on Dio {
  /// Configures Dio to use an HTTP proxy based on environment settings.
  ///
  /// Environment settings:
  /// - HTTP_PROXY_URL : String - URL to the proxy. Proxy will be disabled if empty.
  /// - HTTP_PROXY_TIMEOUT_MS : int - Proxy timeout in milliseconds.
  ///   Default value is 3000 (3 seconds).
  ///
  /// It applies the proxy configuration only if HTTP_PROXY_URL is not empty and platform is not web.
  void useProxy() {
    // Disable proxy for web.
    if (kIsWeb) return;

    // Extract proxy timeout and URL from environment variables.
    const idleTimeout = Duration(
      milliseconds: int.fromEnvironment(
        'HTTP_PROXY_TIMEOUT_MS',
        defaultValue: 3000,
      ),
    );
    const proxyUrl = String.fromEnvironment('HTTP_PROXY_URL');

    // Skip proxy if [proxyUrl] is empty.
    if (proxyUrl.isEmpty) return;

    // Apply proxy configuration based on the platform.
    switch (httpClientAdapter) {
      case final IOHttpClientAdapter adapter:
        // Configure HttpClient to use the proxy.
        adapter.createHttpClient = () => HttpClient()
          ..idleTimeout = idleTimeout
          ..findProxy = (url) {
            return 'PROXY $proxyUrl';
          }
          // Skip certificate validation for Android.
          ..badCertificateCallback = (cert, host, port) => Platform.isAndroid;
      default:
        throw UnimplementedError(
          "Can't use proxy ${httpClientAdapter.runtimeType}",
        );
    }
  }
}
