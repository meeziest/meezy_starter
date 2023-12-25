import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'features/meezy_app.dart';

void main() {
  final bindings = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  /// await some initialization stuff
  bindings.allowFirstFrame();
  FlutterNativeSplash.remove(); // end splash screen

  runApp(
    DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: const MeezyApp(),
    ),
  );
}
