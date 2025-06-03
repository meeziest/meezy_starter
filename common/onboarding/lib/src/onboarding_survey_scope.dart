import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';

import 'bloc/onboarding_bloc.dart';
import 'data/repositories/onboarding_repository.dart';

typedef OnboardingDependencies = ({
  SurveyRepository surveyRepo,
  OnboardingRepository onboardingRepo,
});

class OnboardingSurveyScope extends StatelessWidget {
  const OnboardingSurveyScope({super.key, required this.child, required this.dependencies});

  final OnboardingDependencies dependencies;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(
        dependencies.surveyRepo,
        dependencies.onboardingRepo,
      ),
      child: child,
    );
  }
}
