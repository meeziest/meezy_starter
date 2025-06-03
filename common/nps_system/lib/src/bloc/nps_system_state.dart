part of 'nps_system_bloc.dart';

@freezed
sealed class NpsSystemState with _$NpsSystemState {
  const factory NpsSystemState.idle() = _Idle;
  const factory NpsSystemState.loading() = _Loading;
  const factory NpsSystemState.loaded(QuestionEntity question) = _Loaded;
  const factory NpsSystemState.resultSend() = _ResultSaved;
  const factory NpsSystemState.showStoreRating(StoreTarget target) = _ShowStoreRating;
  const factory NpsSystemState.exception(ExceptionData exception) = _Exception;
}

enum StoreTarget {
  appStore('App Store'),
  googlePlay('Google Play');

  final String nameValue;

  const StoreTarget(this.nameValue);
}
