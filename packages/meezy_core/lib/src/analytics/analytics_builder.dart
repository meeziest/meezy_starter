import 'analytics.dart';

/// A builder for analytics properties.
///
/// This class is used to build a map of properties
/// that can be sent to an analytics service.
final class AnalyticsBuilder {
  AnalyticsBuilder() : properties = [];

  /// The properties that have been added to this builder.
  final List<AnalyticsProperty> properties;

  /// Adds a property to this builder.
  void add(AnalyticsProperty property) => properties.add(property);

  /// Returns the properties as a map.
  ///
  /// This method should be called after all properties have been added.
  Map<String, Object>? toMap() {
    final result = <String, Object>{};
    for (final property in properties) {
      result[property.name] = property.valueSerializable;
    }

    return result;
  }
}
