import 'package:meezy_starter/core/di/dependency.dart';

final class AppDependencies extends Dependencies {
  @override
  List<Object> get dependencies => [
        /// Services
      ];

  @override
  List<Object Function()> get lazyDependencies => [
        /// DataSources
        /// Repositories
      ];
}
