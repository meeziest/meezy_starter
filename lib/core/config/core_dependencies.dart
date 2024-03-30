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
    required this.settingsBloc,
    required this.errorTrackingManager,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  /// [SettingsBloc] instance, used to manage theme and locale.
  final SettingsBloc settingsBloc;

  /// [ErrorTrackingManager] instance, used to report errors.
  final ErrorTrackingManager errorTrackingManager;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final CoreDependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
