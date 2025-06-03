import 'package:onboarding/onboarding.dart';

abstract class SurveyRepository {
  Future<List<SurveyQuestion>> fetchSurveyData();

  Future<void> saveSurveyResponse(List<SurveyResponse> responses);

  Future<bool> isUserPassedSurvey();

  Future<void> markSurveyPassed();
}

abstract class OnboardingRepository {
  Future<List<OnboardingInfo>> fetchOnboardingData();
}
