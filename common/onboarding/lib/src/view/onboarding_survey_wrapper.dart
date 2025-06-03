import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';

import 'package:onboarding/onboarding.dart';

/// Builder that receives the view model for the onboarding survey flow.
typedef OnboardingSurveyWidgetBuilder = Widget Function(
  BuildContext context,
  OnboardingSurveyViewModel viewModel,
);

/// ViewModel containing the flow data and callbacks.
class OnboardingSurveyViewModel {
  final List<SurveyQuestion> surveyQuestions;
  final List<OnboardingInfo> onboardingInfos;
  final Map<String, SurveyResponse> surveyResponses;
  final int pageIndex;
  final VoidCallback goNext;
  final VoidCallback goBack;

  OnboardingSurveyViewModel({
    required this.surveyQuestions,
    required this.onboardingInfos,
    required this.surveyResponses,
    required this.pageIndex,
    required this.goNext,
    required this.goBack,
  });
}

/// Extension to easily access the OnboardingBloc.
extension BuildContextExtensions on BuildContext {
  OnboardingBloc get onboardingBloc => read<OnboardingBloc>();
}

/// A notification for when a survey response is submitted.
class SurveyNotification extends Notification {
  final SurveyResponse surveyResponse;

  String get questionId => surveyResponse.questionId;

  String get optionId => surveyResponse.optionId;

  const SurveyNotification(this.surveyResponse);
}

/// A helper class to capture the onboarding data from the bloc state.
class OnboardingBlocData {
  final List<SurveyQuestion> surveyQuestions;
  final List<OnboardingInfo> onboardingInfos;

  const OnboardingBlocData({
    required this.surveyQuestions,
    required this.onboardingInfos,
  });
}

/// A flow builder widget that manages the survey state and passes a view model
/// to its builder.
class OnboardingSurveyFlowBuilder extends StatefulWidget {
  const OnboardingSurveyFlowBuilder({
    super.key,
    required this.builder,
    this.onFlowCompleted,
  });

  final OnboardingSurveyWidgetBuilder builder;
  final void Function(OnboardingSurveyViewModel viewModel)? onFlowCompleted;

  @override
  State<OnboardingSurveyFlowBuilder> createState() => _OnboardingSurveyFlowBuilderState();
}

class _OnboardingSurveyFlowBuilderState extends State<OnboardingSurveyFlowBuilder> {
  List<SurveyQuestion> surveyQuestions = [];
  List<OnboardingInfo> onboardingInfos = [];
  Map<String, SurveyResponse> surveyResponses = {};

  int pageIndex = 0;

  int get totalPages => surveyQuestions.length + onboardingInfos.length;

  void backStep() {
    if (pageIndex > 0) {
      setState(() => pageIndex--);
    }
  }

  void nextStep() {
    if (pageIndex < totalPages - 1) {
      setState(() => pageIndex++);
    } else {
      widget.onFlowCompleted?.call(
        OnboardingSurveyViewModel(
          surveyQuestions: surveyQuestions,
          onboardingInfos: onboardingInfos,
          surveyResponses: surveyResponses,
          pageIndex: pageIndex,
          goNext: nextStep,
          goBack: backStep,
        ),
      );
    }
  }

  bool saveUserResponse(SurveyNotification notification) {
    setState(() {
      surveyResponses[notification.questionId] = notification.surveyResponse;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    /// Subscribe to the survey questions changes
    final blocData = context.select(
      (OnboardingBloc bloc) => switch (bloc.state) {
        $OnboardingIdle(
          :final surveyQuestions,
          :final onboardingInfo,
        ) =>
          (
            surveyQuestions: surveyQuestions,
            onboardingInfo: onboardingInfo,
          ),
        _ => const (
            surveyQuestions: <SurveyQuestion>[],
            onboardingInfo: <OnboardingInfo>[],
          ),
      },
    );

    // Update local state with data from the bloc.
    surveyQuestions = blocData.surveyQuestions;
    onboardingInfos = blocData.onboardingInfo;

    final viewModel = OnboardingSurveyViewModel(
      surveyQuestions: surveyQuestions,
      onboardingInfos: onboardingInfos,
      surveyResponses: surveyResponses,
      pageIndex: pageIndex,
      goNext: nextStep,
      goBack: backStep,
    );

    return NotificationListener<SurveyNotification>(
      onNotification: saveUserResponse,
      child: widget.builder(context, viewModel),
    );
  }
}
