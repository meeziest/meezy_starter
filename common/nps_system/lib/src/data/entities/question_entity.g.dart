// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionEntityImpl _$$QuestionEntityImplFromJson(Map<String, dynamic> json) =>
    _$QuestionEntityImpl(
      questionID: json['questionID'] as String,
      questionText: json['questionText'] as String,
      maxRating: (json['maxRating'] as num).toInt(),
    );

Map<String, dynamic> _$$QuestionEntityImplToJson(
        _$QuestionEntityImpl instance) =>
    <String, dynamic>{
      'questionID': instance.questionID,
      'questionText': instance.questionText,
      'maxRating': instance.maxRating,
    };
