/// A generic class for storing and retrieving analytics data.
///
/// Example:
/// ```dart
/// // Define AnalyticsInfo wrapper.
/// class DepositInfoEntityAnalyticsInfo extends AnalyticsInfo<DepositInfoEntity> {
///  DepositInfoEntityAnalyticsInfo(super.value);
///
///  SelectDepositScreenViewDepositType get depositType {
///    return switch (value.depositRateCode) {
///      DepositRateCode.ordinary => SelectDepositScreenViewDepositType.term,
///      _ => SelectDepositScreenViewDepositType.fixed,
///    };
///  }
///
///  SelectDepositDepositsName get depositName {
///    return SelectDepositDepositsName(depositRateCode: value.depositRateCode);
///  }
/// }
///
/// // Add extension to get AnalyticsInfo wrapper.
/// extension DepositInfoEntityExtension on DepositInfoEntity {
///  DepositInfoEntityAnalyticsInfo get analyticsInfo =>
///      DepositInfoEntityAnalyticsInfo(this);
/// }
///
/// ```
class AnalyticsInfo<T> {
  /// The value associated with the analytics data.
  final T _value;

  /// Returns the value associated with the analytics data.
  T get value => _value;

  /// Creates a new instance of AnalyticsInfo with the given value.
  AnalyticsInfo(T value) : _value = value;
}
