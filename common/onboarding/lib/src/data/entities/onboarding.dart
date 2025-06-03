import 'package:equatable/equatable.dart';

part 'onboarding_info.dart';

part 'survey_question.dart';

sealed class Onboarding {
  abstract final int position;
}
