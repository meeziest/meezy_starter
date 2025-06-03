import 'package:meezy_core/meezy_core.dart';
import 'package:onboarding/onboarding.dart';

part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends MeezyBloc<OnboardingEvent, OnboardingState> {
  final SurveyRepository _surveyRepository;
  final OnboardingRepository _onboardingRepository;

  OnboardingBloc(
    this._surveyRepository,
    this._onboardingRepository,
  ) : super(const OnboardingState.idle()) {
    on<SaveSurveyResponse>(
      _saveSurveyResponse,
      transformer: droppable(),
    );
    on<FetchOnboardingData>(
      _fetchOnboardingData,
      transformer: droppable(),
    );
    on<CheckSurveyStatus>(
      _checkSurveyStatus,
      transformer: droppable(),
    );
  }

  Future<void> _checkSurveyStatus(
    CheckSurveyStatus event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(OnboardingState.loading(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
      ));

      final isPassed = await _surveyRepository.isUserPassedSurvey();

      if (isPassed) {
        emit(OnboardingState.completed(
          surveyQuestions: state.surveyQuestions,
          onboardingInfo: state.onboardingInfo,
        ));
      } else {
        add(const OnboardingEvent.fetchOnboardingData());
      }
    } on Exception catch (e, st) {
      super.onError(e, st);
      emit(OnboardingState.exception(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
        exception: ExceptionData.error(
          title: 'Survey Error',
          message: 'Failed to check survey status',
          detailed: e,
        ),
      ));
    }
  }

  Future<void> _saveSurveyResponse(
    SaveSurveyResponse event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      if (event.surveyResponses.isEmpty) return;

      emit(OnboardingState.loading(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
      ));

      await _surveyRepository.saveSurveyResponse(event.surveyResponses);
      await _surveyRepository.markSurveyPassed();

      emit(OnboardingState.completed(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
      ));
    } on Exception catch (e, st) {
      super.onError(e, st);
      emit(OnboardingState.exception(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
        exception: ExceptionData.error(
          title: 'Survey Error',
          message: 'Failed to save survey response',
          detailed: e,
        ),
      ));
    }
  }

  Future<void> _fetchOnboardingData(
    FetchOnboardingData event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(OnboardingState.loading(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
      ));

      List<OnboardingInfo>? onboardingInfos;
      List<SurveyQuestion>? surveyQuestions;

      await runTasks([
        () async {
          onboardingInfos = await _onboardingRepository.fetchOnboardingData();
        },
        () async {
          surveyQuestions = await _surveyRepository.fetchSurveyData();
        },
      ], isSafe: true);

      emit(OnboardingState.idle(
        surveyQuestions: surveyQuestions ?? [],
        onboardingInfo: onboardingInfos ?? [],
      ));
    } on Exception catch (e, st) {
      super.onError(e, st);
      emit(OnboardingState.exception(
        surveyQuestions: state.surveyQuestions,
        onboardingInfo: state.onboardingInfo,
        exception: ExceptionData.error(
          title: 'Onboarding Error',
          message: 'Failed to fetch onboarding data',
          detailed: e,
        ),
      ));
    }
  }
}

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.checkSurveyStatus() = CheckSurveyStatus;

  const factory OnboardingEvent.saveSurveyResponse(
    List<SurveyResponse> surveyResponses,
  ) = SaveSurveyResponse;

  const factory OnboardingEvent.fetchOnboardingData() = FetchOnboardingData;
}

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState.idle({
    @Default([]) List<SurveyQuestion> surveyQuestions,
    @Default([]) List<OnboardingInfo> onboardingInfo,
  }) = $OnboardingIdle;

  const factory OnboardingState.loading({
    @Default([]) List<SurveyQuestion> surveyQuestions,
    @Default([]) List<OnboardingInfo> onboardingInfo,
  }) = $OnboardingLoading;

  const factory OnboardingState.exception({
    @Default([]) List<SurveyQuestion> surveyQuestions,
    @Default([]) List<OnboardingInfo> onboardingInfo,
    required ExceptionData exception,
  }) = $OnboardingException;

  const factory OnboardingState.completed({
    @Default([]) List<SurveyQuestion> surveyQuestions,
    @Default([]) List<OnboardingInfo> onboardingInfo,
  }) = $OnboardingCompleted;
}
