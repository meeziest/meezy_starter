import '../entities/question_entity.dart';
import '../entities/survey_result.dart';

abstract interface class NPSRepository {
  Future<QuestionEntity> getSurvey();
  Future<bool> isNeedToShowNPS();
  Future<void> sendRating(NPSResult request);
}

class MockSurveyRepository implements NPSRepository {
  @override
  Future<QuestionEntity> getSurvey() async {
    // Return a mock list of questions
    return const QuestionEntity(
      questionID: 'NPS_QUESTION',
      questionText: 'How satisfied are you with the app?',
      maxRating: 5,
    );
  }

  @override
  Future<void> sendRating(NPSResult request) async {
    // Mock sending survey result
    print('Survey result sent: ${request.toString()}');
  }

  @override
  Future<bool> isNeedToShowNPS() {
    // TODO: implement isNeedToShowNPS
    throw UnimplementedError();
  }
}
