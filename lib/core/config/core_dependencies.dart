import 'package:flutter/cupertino.dart';
import 'package:meezy_starter/core/client/rest_client_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/presentation/bloc/settings_bloc.dart';
import '../tracker/error_tracker.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class CoreDependencies {
  /// {@macro dependencies}
  const CoreDependencies({
    required this.sharedPreferences,
    required this.settingsBlocBuilder,
    required this.errorTrackingManager,
    required this.authClient,
    required this.client,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  /// [SettingsBloc] instance, used to manage theme and locale.
  final SettingsBloc Function(BuildContext context) settingsBlocBuilder;

  /// [ErrorTrackingManager] instance, used to report errors.
  final ErrorTrackingManager errorTrackingManager;

  /// [RestClient] instance, used to handle auth apis.
  final RestClient authClient;

  /// [RestClient] instance, used to handle apis.
  final RestClient client;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.coreDependencies,
    required this.msSpent,
  });

  /// The dependencies
  final CoreDependencies coreDependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $coreDependencies, '
      'msSpent: $msSpent'
      ')';
}
