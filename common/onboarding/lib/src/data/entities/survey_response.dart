import 'package:equatable/equatable.dart';

class SurveyResponse extends Equatable {
  final String questionId;
  final String optionId;

  const SurveyResponse({
    required this.questionId,
    required this.optionId,
  });

  factory SurveyResponse.fromJson(Map<String, dynamic> json) {
    return SurveyResponse(
      questionId: json['surveyId'] as String,
      optionId: json['optionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyId': questionId,
      'optionId': optionId,
    };
  }

  @override
  List<Object> get props => [questionId, optionId];
}
