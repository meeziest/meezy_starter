import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_entity.freezed.dart';
part 'question_entity.g.dart';

@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required String questionID,
    required String questionText,
    required int maxRating,
  }) = _QuestionEntity;

  factory QuestionEntity.fromJson(Map<String, dynamic> json) => _$QuestionEntityFromJson(json);
}
