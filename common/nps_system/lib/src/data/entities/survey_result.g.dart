// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NPSResultImpl _$$NPSResultImplFromJson(Map<String, dynamic> json) =>
    _$NPSResultImpl(
      questionID: json['questionID'] as String,
      rating: (json['rating'] as num).toInt(),
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$$NPSResultImplToJson(_$NPSResultImpl instance) =>
    <String, dynamic>{
      'questionID': instance.questionID,
      'rating': instance.rating,
      'feedback': instance.feedback,
    };
