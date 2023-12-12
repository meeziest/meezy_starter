import 'dart:async';

abstract mixin class Disposable {
  Future<void> dispose();
}

abstract base class Dependencies {
  Map<Type, Object> _dependencies = {};
  Map<Type, Object Function()> _lazyDependencies = {};

  List<Object> get dependencies;
  List<Object Function()> get lazyDependencies;

  Future<void> prepare() async {
    for (final dependency in dependencies) {
      _dependencies[dependency.runtimeType] = dependency;
    }
    await _prepareLazy();
  }

  Future<void> _prepareLazy() async {
    for (final lazyDependency in lazyDependencies) {
      _lazyDependencies[lazyDependency.runtimeType] = lazyDependency;
    }
  }

  Object? get<T extends Object>() {
    if (_dependencies.isNotEmpty && _dependencies.containsKey(T)) {
      return _dependencies[T];
    }
    if (_lazyDependencies.isNotEmpty && _lazyDependencies.containsKey(T)) {
      final dependency = _lazyDependencies[T]!.call();
      put(dependency);
      return dependency;
    }
    throw DependencyError(
      'Dependency with name $T} type $T is not registered inside scope.',
    );
  }

  void put<T extends Object>(T dependency) {
    throwIfNot(
      !_dependencies.containsKey(T) && !_lazyDependencies.containsKey(T),
      DependencyError(
        'Dependency with name $T} type $T is already registered inside scope.',
      ),
    );
    _dependencies[T] = dependency;
  }

  void putLazy<T extends Object>(T Function() dependencyInitter) {
    throwIfNot(
      !_lazyDependencies.containsKey(T) && !_dependencies.containsKey(T),
      DependencyError(
        'Dependency with name $T} type $T is already registered inside scope.',
      ),
    );
    _lazyDependencies[T] = dependencyInitter;
  }

  Future<void> dispose() async {
    if (_dependencies.isEmpty) return;

    final streamIterable = Stream.fromIterable(_dependencies.entries);
    await for (final step in streamIterable) {
      if (step.value is Disposable) {
        await (step.value as Disposable).dispose();
      }
    }
  }
}

void throwIfNot(bool condition, Object error) {
  if (!condition) throw error;
}

class DependencyError extends Error {
  final String message;

  DependencyError(this.message);
  String toString() => "Bad state: $message";
}
