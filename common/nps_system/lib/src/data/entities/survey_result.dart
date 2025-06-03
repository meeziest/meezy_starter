import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_result.freezed.dart';
part 'survey_result.g.dart';

@freezed
class NPSResult with _$NPSResult {
  const factory NPSResult({
    required String questionID,
    required int rating,
    required String feedback,
  }) = _NPSResult;

  factory NPSResult.fromJson(Map<String, dynamic> json) => _$NPSResultFromJson(json);
}
