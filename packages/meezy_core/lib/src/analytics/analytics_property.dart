sealed class AnalyticsProperty<T extends Object> {
  const AnalyticsProperty(this.name, this.value, {this.meta});

  /// The name of this property.
  final String name;

  /// The value of this property.
  final T value;

  /// Additional information about this property.
  ///
  /// This can be used to provide additional context about the property.
  final Object? meta;

  /// Returns the value of this property in a form that is OK for engine.
  ///
  /// If the value is not serializable, this field should be
  /// overridden to return a serializable value.
  Object get valueSerializable => value;
}

final class IntAnalyticsProperty extends AnalyticsProperty<int> {
  IntAnalyticsProperty(super.name, super.value, {super.meta});
}

final class DoubleAnalyticsProperty extends AnalyticsProperty<double> {
  DoubleAnalyticsProperty(super.name, super.value, {super.meta});
}

final class StringAnalyticsProperty extends AnalyticsProperty<String> {
  StringAnalyticsProperty(super.name, super.value, {super.meta});

  @override
  Object get valueSerializable => value.toLowerCase();
}

final class FlagAnalyticsProperty extends AnalyticsProperty<bool> {
  FlagAnalyticsProperty(super.name, super.value, {super.meta});

  @override
  Object get valueSerializable => value ? 'true' : 'false';
}
