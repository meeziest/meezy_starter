part of 'onboarding.dart';

class SurveyQuestion extends Equatable implements Onboarding {
  final String id;
  final String question;
  final SurveyQuestionType type;
  final bool required;
  final List<SurveyOption> options;
  final int order;
  final int? globalPosition;

  const SurveyQuestion({
    required this.id,
    required this.question,
    required this.type,
    required this.required,
    required this.options,
    required this.order,
    this.globalPosition,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) {
    return SurveyQuestion(
      id: "${json['id'] as int}",
      question: json['question'] as String,
      type: SurveyQuestionType.fromJson(json['type'] as String),
      required: json['required'] as bool,
      options: (json['survey_options'] as List)
          .map((option) => SurveyOption.fromJson(option as Map<String, dynamic>))
          .toList(),
      order: json['order'] as int,
      globalPosition: json['global_position'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'type': type.value,
      'required': required,
      'options': options.map((option) => option.toJson()).toList(),
      'order': order,
    };
  }

  @override
  List<Object?> get props => [id, question, type, required, options, order, globalPosition];

  @override
  int get position => globalPosition ?? -1;
}

enum SurveyQuestionType {
  singleChoice('single_choice'),
  multipleChoice('multiple_choice');

  final String value;

  const SurveyQuestionType(this.value);

  static SurveyQuestionType fromJson(String type) {
    switch (type) {
      case 'single_choice':
        return SurveyQuestionType.singleChoice;
      case 'multiple_choice':
        return SurveyQuestionType.multipleChoice;
      default:
        throw Exception('Unknown survey question type: $type');
    }
  }
}

class SurveyOption extends Equatable {
  final String id;
  final String option;
  final int order;

  const SurveyOption({
    required this.id,
    required this.option,
    required this.order,
  });

  factory SurveyOption.fromJson(Map<String, dynamic> json) {
    return SurveyOption(
      id: json['id'] as String,
      option: json['option'] as String,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'option': option,
      'order': order,
    };
  }

  @override
  List<Object?> get props => [id, option, order];
}
