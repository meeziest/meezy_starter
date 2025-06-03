import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:meezy_core/meezy_core.dart';
import 'package:nps_system/src/data/entities/survey_result.dart';

import '../data/entities/question_entity.dart';
import '../data/repositories/survey_repository.dart';

part 'nps_system_bloc.freezed.dart';
part 'nps_system_event.dart';
part 'nps_system_state.dart';

class NpsSystemBloc extends MeezyBloc<NpsSystemEvent, NpsSystemState> {
  final NPSRepository _surveyRepository;

  NpsSystemBloc({
    required NPSRepository surveyRepository,
  })  : _surveyRepository = surveyRepository,
        super(const NpsSystemState.idle());

  @override
  EventTransformer<NpsSystemEvent> get eventTransformer => concurrency.droppable();

  /// Handles incoming events and directs them to the appropriate method.
  @override
  Future<void> onEventHandler(NpsSystemEvent event, Emitter<NpsSystemState> emit) async {
    return switch (event) {
      GetNPS() => _getNPS(event),
      SendNPSResult() => _sendNPSResult(event),
    };
  }

  /// Fetches a survey.
  Future<void> _getNPS(GetNPS event) async {
    try {
      setState(const NpsSystemState.loading());
      final isNeedToShowNPS = await _surveyRepository.isNeedToShowNPS();
      if (isNeedToShowNPS) {
        final survey = await _surveyRepository.getSurvey();
        setState(NpsSystemState.loaded(survey));
      }
    } finally {
      setState(const NpsSystemState.idle());
    }
  }

  /// Sends the survey result and determines if a store rating prompt should be shown.
  Future<void> _sendNPSResult(SendNPSResult event) async {
    try {
      setState(const NpsSystemState.loading());
      await _surveyRepository.sendRating(event.request);

      // Updates state to indicate the survey result has been successfully sent.
      setState(const NpsSystemState.resultSend());

      // If the first survey question response equals the maximum rating,
      if (event.request.rating == event.maxRating) {
        if (Platform.isAndroid) {
          setState(const NpsSystemState.showStoreRating(StoreTarget.googlePlay));
        }
        if (Platform.isIOS) {
          setState(const NpsSystemState.showStoreRating(StoreTarget.appStore));
        }
      }
    } on Object catch (e, st) {
      setState(const NpsSystemState.exception(ExceptionData.error()));
      super.onError(e, st);
    } finally {
      setState(const NpsSystemState.idle());
    }
  }
}
