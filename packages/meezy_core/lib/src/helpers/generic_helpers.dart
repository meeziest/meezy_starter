T it<T>(T value) => value;
R let<R>(R Function() function) => function();
C Function(A) composeRL<A, B, C>(C Function(B) f, B Function(A) g) =>
    (x) => f(g(x));
C Function(A) composeLR<A, B, C>(B Function(A) f, C Function(B) g) =>
    composeRL(g, f);

bool isNullable<T>() => null is T;
bool isType<T, Y>() => T == Y;

extension GenericExtension<T> on T {
  String toTag() => (T).toString();

  Future<T> toFuture() => Future.value(this);
}

extension NullableGenericExtension<T> on T? {
  T1? asTypeOrNull<T1>() => this is T1 ? this as T1 : null;

  int compareToNullable(T? b, int Function(T, T) compare) {
    if (this == null && b == null) {
      return 0;
    } else if (this == null && b != null) {
      return 1;
    } else if (this != null && b == null) {
      return -1;
    } else {
      return compare(this as T, b as T);
    }
  }

  bool isOneOf(List<Object?> values) {
    return values.any((it) => it == this);
  }
}

extension ScopeFunctionExtension<T> on T {
  R let<R>(R Function(T it) function) => function(this);
  T also(void Function(T it) function) {
    function(this);
    return this;
  }
}

extension FuncExtension<A, B> on B Function(A) {
  C Function(A) compose<C>(C Function(B) g) => composeRL(g, this);
}

extension BooleanExtension on bool {
  T fold<T>({required T Function() onFalse, required T Function() onTrue}) {
    return this ? onTrue() : onFalse();
  }
}