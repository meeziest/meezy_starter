import '../../../meezy_core.dart';

part 'exception_data.freezed.dart';

@freezed
sealed class ExceptionData with _$ExceptionData {
  const ExceptionData._();

  const factory ExceptionData.warning({
    @Default(null) String? title,
    @Default(null) String? message,
    @Default(null) Object? detailed,
  }) = $Warning;

  const factory ExceptionData.info({
    @Default(null) String? title,
    @Default(null) String? message,
    @Default(null) Object? detailed,
  }) = $Info;

  const factory ExceptionData.error({
    @Default(null) String? title,
    @Default(null) String? message,
    @Default(null) Object? detailed,
  }) = $Error;
}
