// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkSurveyStatus,
    required TResult Function(List<SurveyResponse> surveyResponses)
        saveSurveyResponse,
    required TResult Function() fetchOnboardingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkSurveyStatus,
    TResult? Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult? Function()? fetchOnboardingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkSurveyStatus,
    TResult Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult Function()? fetchOnboardingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckSurveyStatus value) checkSurveyStatus,
    required TResult Function(SaveSurveyResponse value) saveSurveyResponse,
    required TResult Function(FetchOnboardingData value) fetchOnboardingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult? Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult? Function(FetchOnboardingData value)? fetchOnboardingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult Function(FetchOnboardingData value)? fetchOnboardingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(
          OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res, OnboardingEvent>;
}

/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res, $Val extends OnboardingEvent>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckSurveyStatusImplCopyWith<$Res> {
  factory _$$CheckSurveyStatusImplCopyWith(_$CheckSurveyStatusImpl value,
          $Res Function(_$CheckSurveyStatusImpl) then) =
      __$$CheckSurveyStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckSurveyStatusImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$CheckSurveyStatusImpl>
    implements _$$CheckSurveyStatusImplCopyWith<$Res> {
  __$$CheckSurveyStatusImplCopyWithImpl(_$CheckSurveyStatusImpl _value,
      $Res Function(_$CheckSurveyStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckSurveyStatusImpl implements CheckSurveyStatus {
  const _$CheckSurveyStatusImpl();

  @override
  String toString() {
    return 'OnboardingEvent.checkSurveyStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckSurveyStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkSurveyStatus,
    required TResult Function(List<SurveyResponse> surveyResponses)
        saveSurveyResponse,
    required TResult Function() fetchOnboardingData,
  }) {
    return checkSurveyStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkSurveyStatus,
    TResult? Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult? Function()? fetchOnboardingData,
  }) {
    return checkSurveyStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkSurveyStatus,
    TResult Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult Function()? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (checkSurveyStatus != null) {
      return checkSurveyStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckSurveyStatus value) checkSurveyStatus,
    required TResult Function(SaveSurveyResponse value) saveSurveyResponse,
    required TResult Function(FetchOnboardingData value) fetchOnboardingData,
  }) {
    return checkSurveyStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult? Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult? Function(FetchOnboardingData value)? fetchOnboardingData,
  }) {
    return checkSurveyStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult Function(FetchOnboardingData value)? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (checkSurveyStatus != null) {
      return checkSurveyStatus(this);
    }
    return orElse();
  }
}

abstract class CheckSurveyStatus implements OnboardingEvent {
  const factory CheckSurveyStatus() = _$CheckSurveyStatusImpl;
}

/// @nodoc
abstract class _$$SaveSurveyResponseImplCopyWith<$Res> {
  factory _$$SaveSurveyResponseImplCopyWith(_$SaveSurveyResponseImpl value,
          $Res Function(_$SaveSurveyResponseImpl) then) =
      __$$SaveSurveyResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SurveyResponse> surveyResponses});
}

/// @nodoc
class __$$SaveSurveyResponseImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$SaveSurveyResponseImpl>
    implements _$$SaveSurveyResponseImplCopyWith<$Res> {
  __$$SaveSurveyResponseImplCopyWithImpl(_$SaveSurveyResponseImpl _value,
      $Res Function(_$SaveSurveyResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyResponses = null,
  }) {
    return _then(_$SaveSurveyResponseImpl(
      null == surveyResponses
          ? _value._surveyResponses
          : surveyResponses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponse>,
    ));
  }
}

/// @nodoc

class _$SaveSurveyResponseImpl implements SaveSurveyResponse {
  const _$SaveSurveyResponseImpl(final List<SurveyResponse> surveyResponses)
      : _surveyResponses = surveyResponses;

  final List<SurveyResponse> _surveyResponses;
  @override
  List<SurveyResponse> get surveyResponses {
    if (_surveyResponses is EqualUnmodifiableListView) return _surveyResponses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveyResponses);
  }

  @override
  String toString() {
    return 'OnboardingEvent.saveSurveyResponse(surveyResponses: $surveyResponses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSurveyResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._surveyResponses, _surveyResponses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_surveyResponses));

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSurveyResponseImplCopyWith<_$SaveSurveyResponseImpl> get copyWith =>
      __$$SaveSurveyResponseImplCopyWithImpl<_$SaveSurveyResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkSurveyStatus,
    required TResult Function(List<SurveyResponse> surveyResponses)
        saveSurveyResponse,
    required TResult Function() fetchOnboardingData,
  }) {
    return saveSurveyResponse(surveyResponses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkSurveyStatus,
    TResult? Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult? Function()? fetchOnboardingData,
  }) {
    return saveSurveyResponse?.call(surveyResponses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkSurveyStatus,
    TResult Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult Function()? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (saveSurveyResponse != null) {
      return saveSurveyResponse(surveyResponses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckSurveyStatus value) checkSurveyStatus,
    required TResult Function(SaveSurveyResponse value) saveSurveyResponse,
    required TResult Function(FetchOnboardingData value) fetchOnboardingData,
  }) {
    return saveSurveyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult? Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult? Function(FetchOnboardingData value)? fetchOnboardingData,
  }) {
    return saveSurveyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult Function(FetchOnboardingData value)? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (saveSurveyResponse != null) {
      return saveSurveyResponse(this);
    }
    return orElse();
  }
}

abstract class SaveSurveyResponse implements OnboardingEvent {
  const factory SaveSurveyResponse(final List<SurveyResponse> surveyResponses) =
      _$SaveSurveyResponseImpl;

  List<SurveyResponse> get surveyResponses;

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveSurveyResponseImplCopyWith<_$SaveSurveyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOnboardingDataImplCopyWith<$Res> {
  factory _$$FetchOnboardingDataImplCopyWith(_$FetchOnboardingDataImpl value,
          $Res Function(_$FetchOnboardingDataImpl) then) =
      __$$FetchOnboardingDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOnboardingDataImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$FetchOnboardingDataImpl>
    implements _$$FetchOnboardingDataImplCopyWith<$Res> {
  __$$FetchOnboardingDataImplCopyWithImpl(_$FetchOnboardingDataImpl _value,
      $Res Function(_$FetchOnboardingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOnboardingDataImpl implements FetchOnboardingData {
  const _$FetchOnboardingDataImpl();

  @override
  String toString() {
    return 'OnboardingEvent.fetchOnboardingData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOnboardingDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkSurveyStatus,
    required TResult Function(List<SurveyResponse> surveyResponses)
        saveSurveyResponse,
    required TResult Function() fetchOnboardingData,
  }) {
    return fetchOnboardingData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkSurveyStatus,
    TResult? Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult? Function()? fetchOnboardingData,
  }) {
    return fetchOnboardingData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkSurveyStatus,
    TResult Function(List<SurveyResponse> surveyResponses)? saveSurveyResponse,
    TResult Function()? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (fetchOnboardingData != null) {
      return fetchOnboardingData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckSurveyStatus value) checkSurveyStatus,
    required TResult Function(SaveSurveyResponse value) saveSurveyResponse,
    required TResult Function(FetchOnboardingData value) fetchOnboardingData,
  }) {
    return fetchOnboardingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult? Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult? Function(FetchOnboardingData value)? fetchOnboardingData,
  }) {
    return fetchOnboardingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckSurveyStatus value)? checkSurveyStatus,
    TResult Function(SaveSurveyResponse value)? saveSurveyResponse,
    TResult Function(FetchOnboardingData value)? fetchOnboardingData,
    required TResult orElse(),
  }) {
    if (fetchOnboardingData != null) {
      return fetchOnboardingData(this);
    }
    return orElse();
  }
}

abstract class FetchOnboardingData implements OnboardingEvent {
  const factory FetchOnboardingData() = _$FetchOnboardingDataImpl;
}

/// @nodoc
mixin _$OnboardingState {
  List<SurveyQuestion> get surveyQuestions =>
      throw _privateConstructorUsedError;
  List<OnboardingInfo> get onboardingInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        idle,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        loading,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)
        exception,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($OnboardingIdle value) idle,
    required TResult Function($OnboardingLoading value) loading,
    required TResult Function($OnboardingException value) exception,
    required TResult Function($OnboardingCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($OnboardingIdle value)? idle,
    TResult? Function($OnboardingLoading value)? loading,
    TResult? Function($OnboardingException value)? exception,
    TResult? Function($OnboardingCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($OnboardingIdle value)? idle,
    TResult Function($OnboardingLoading value)? loading,
    TResult Function($OnboardingException value)? exception,
    TResult Function($OnboardingCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {List<SurveyQuestion> surveyQuestions,
      List<OnboardingInfo> onboardingInfo});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyQuestions = null,
    Object? onboardingInfo = null,
  }) {
    return _then(_value.copyWith(
      surveyQuestions: null == surveyQuestions
          ? _value.surveyQuestions
          : surveyQuestions // ignore: cast_nullable_to_non_nullable
              as List<SurveyQuestion>,
      onboardingInfo: null == onboardingInfo
          ? _value.onboardingInfo
          : onboardingInfo // ignore: cast_nullable_to_non_nullable
              as List<OnboardingInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$OnboardingIdleImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$$OnboardingIdleImplCopyWith(_$$OnboardingIdleImpl value,
          $Res Function(_$$OnboardingIdleImpl) then) =
      __$$$OnboardingIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SurveyQuestion> surveyQuestions,
      List<OnboardingInfo> onboardingInfo});
}

/// @nodoc
class __$$$OnboardingIdleImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$$OnboardingIdleImpl>
    implements _$$$OnboardingIdleImplCopyWith<$Res> {
  __$$$OnboardingIdleImplCopyWithImpl(
      _$$OnboardingIdleImpl _value, $Res Function(_$$OnboardingIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyQuestions = null,
    Object? onboardingInfo = null,
  }) {
    return _then(_$$OnboardingIdleImpl(
      surveyQuestions: null == surveyQuestions
          ? _value._surveyQuestions
          : surveyQuestions // ignore: cast_nullable_to_non_nullable
              as List<SurveyQuestion>,
      onboardingInfo: null == onboardingInfo
          ? _value._onboardingInfo
          : onboardingInfo // ignore: cast_nullable_to_non_nullable
              as List<OnboardingInfo>,
    ));
  }
}

/// @nodoc

class _$$OnboardingIdleImpl implements $OnboardingIdle {
  const _$$OnboardingIdleImpl(
      {final List<SurveyQuestion> surveyQuestions = const [],
      final List<OnboardingInfo> onboardingInfo = const []})
      : _surveyQuestions = surveyQuestions,
        _onboardingInfo = onboardingInfo;

  final List<SurveyQuestion> _surveyQuestions;
  @override
  @JsonKey()
  List<SurveyQuestion> get surveyQuestions {
    if (_surveyQuestions is EqualUnmodifiableListView) return _surveyQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveyQuestions);
  }

  final List<OnboardingInfo> _onboardingInfo;
  @override
  @JsonKey()
  List<OnboardingInfo> get onboardingInfo {
    if (_onboardingInfo is EqualUnmodifiableListView) return _onboardingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onboardingInfo);
  }

  @override
  String toString() {
    return 'OnboardingState.idle(surveyQuestions: $surveyQuestions, onboardingInfo: $onboardingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$OnboardingIdleImpl &&
            const DeepCollectionEquality()
                .equals(other._surveyQuestions, _surveyQuestions) &&
            const DeepCollectionEquality()
                .equals(other._onboardingInfo, _onboardingInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyQuestions),
      const DeepCollectionEquality().hash(_onboardingInfo));

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$OnboardingIdleImplCopyWith<_$$OnboardingIdleImpl> get copyWith =>
      __$$$OnboardingIdleImplCopyWithImpl<_$$OnboardingIdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        idle,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        loading,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)
        exception,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        completed,
  }) {
    return idle(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
  }) {
    return idle?.call(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(surveyQuestions, onboardingInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($OnboardingIdle value) idle,
    required TResult Function($OnboardingLoading value) loading,
    required TResult Function($OnboardingException value) exception,
    required TResult Function($OnboardingCompleted value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($OnboardingIdle value)? idle,
    TResult? Function($OnboardingLoading value)? loading,
    TResult? Function($OnboardingException value)? exception,
    TResult? Function($OnboardingCompleted value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($OnboardingIdle value)? idle,
    TResult Function($OnboardingLoading value)? loading,
    TResult Function($OnboardingException value)? exception,
    TResult Function($OnboardingCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class $OnboardingIdle implements OnboardingState {
  const factory $OnboardingIdle(
      {final List<SurveyQuestion> surveyQuestions,
      final List<OnboardingInfo> onboardingInfo}) = _$$OnboardingIdleImpl;

  @override
  List<SurveyQuestion> get surveyQuestions;
  @override
  List<OnboardingInfo> get onboardingInfo;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$OnboardingIdleImplCopyWith<_$$OnboardingIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$OnboardingLoadingImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$$OnboardingLoadingImplCopyWith(_$$OnboardingLoadingImpl value,
          $Res Function(_$$OnboardingLoadingImpl) then) =
      __$$$OnboardingLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SurveyQuestion> surveyQuestions,
      List<OnboardingInfo> onboardingInfo});
}

/// @nodoc
class __$$$OnboardingLoadingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$$OnboardingLoadingImpl>
    implements _$$$OnboardingLoadingImplCopyWith<$Res> {
  __$$$OnboardingLoadingImplCopyWithImpl(_$$OnboardingLoadingImpl _value,
      $Res Function(_$$OnboardingLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyQuestions = null,
    Object? onboardingInfo = null,
  }) {
    return _then(_$$OnboardingLoadingImpl(
      surveyQuestions: null == surveyQuestions
          ? _value._surveyQuestions
          : surveyQuestions // ignore: cast_nullable_to_non_nullable
              as List<SurveyQuestion>,
      onboardingInfo: null == onboardingInfo
          ? _value._onboardingInfo
          : onboardingInfo // ignore: cast_nullable_to_non_nullable
              as List<OnboardingInfo>,
    ));
  }
}

/// @nodoc

class _$$OnboardingLoadingImpl implements $OnboardingLoading {
  const _$$OnboardingLoadingImpl(
      {final List<SurveyQuestion> surveyQuestions = const [],
      final List<OnboardingInfo> onboardingInfo = const []})
      : _surveyQuestions = surveyQuestions,
        _onboardingInfo = onboardingInfo;

  final List<SurveyQuestion> _surveyQuestions;
  @override
  @JsonKey()
  List<SurveyQuestion> get surveyQuestions {
    if (_surveyQuestions is EqualUnmodifiableListView) return _surveyQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveyQuestions);
  }

  final List<OnboardingInfo> _onboardingInfo;
  @override
  @JsonKey()
  List<OnboardingInfo> get onboardingInfo {
    if (_onboardingInfo is EqualUnmodifiableListView) return _onboardingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onboardingInfo);
  }

  @override
  String toString() {
    return 'OnboardingState.loading(surveyQuestions: $surveyQuestions, onboardingInfo: $onboardingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$OnboardingLoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._surveyQuestions, _surveyQuestions) &&
            const DeepCollectionEquality()
                .equals(other._onboardingInfo, _onboardingInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyQuestions),
      const DeepCollectionEquality().hash(_onboardingInfo));

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$OnboardingLoadingImplCopyWith<_$$OnboardingLoadingImpl> get copyWith =>
      __$$$OnboardingLoadingImplCopyWithImpl<_$$OnboardingLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        idle,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        loading,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)
        exception,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        completed,
  }) {
    return loading(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
  }) {
    return loading?.call(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(surveyQuestions, onboardingInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($OnboardingIdle value) idle,
    required TResult Function($OnboardingLoading value) loading,
    required TResult Function($OnboardingException value) exception,
    required TResult Function($OnboardingCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($OnboardingIdle value)? idle,
    TResult? Function($OnboardingLoading value)? loading,
    TResult? Function($OnboardingException value)? exception,
    TResult? Function($OnboardingCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($OnboardingIdle value)? idle,
    TResult Function($OnboardingLoading value)? loading,
    TResult Function($OnboardingException value)? exception,
    TResult Function($OnboardingCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class $OnboardingLoading implements OnboardingState {
  const factory $OnboardingLoading(
      {final List<SurveyQuestion> surveyQuestions,
      final List<OnboardingInfo> onboardingInfo}) = _$$OnboardingLoadingImpl;

  @override
  List<SurveyQuestion> get surveyQuestions;
  @override
  List<OnboardingInfo> get onboardingInfo;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$OnboardingLoadingImplCopyWith<_$$OnboardingLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$OnboardingExceptionImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$$OnboardingExceptionImplCopyWith(_$$OnboardingExceptionImpl value,
          $Res Function(_$$OnboardingExceptionImpl) then) =
      __$$$OnboardingExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SurveyQuestion> surveyQuestions,
      List<OnboardingInfo> onboardingInfo,
      ExceptionData exception});

  $ExceptionDataCopyWith<$Res> get exception;
}

/// @nodoc
class __$$$OnboardingExceptionImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$$OnboardingExceptionImpl>
    implements _$$$OnboardingExceptionImplCopyWith<$Res> {
  __$$$OnboardingExceptionImplCopyWithImpl(_$$OnboardingExceptionImpl _value,
      $Res Function(_$$OnboardingExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyQuestions = null,
    Object? onboardingInfo = null,
    Object? exception = null,
  }) {
    return _then(_$$OnboardingExceptionImpl(
      surveyQuestions: null == surveyQuestions
          ? _value._surveyQuestions
          : surveyQuestions // ignore: cast_nullable_to_non_nullable
              as List<SurveyQuestion>,
      onboardingInfo: null == onboardingInfo
          ? _value._onboardingInfo
          : onboardingInfo // ignore: cast_nullable_to_non_nullable
              as List<OnboardingInfo>,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ExceptionData,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExceptionDataCopyWith<$Res> get exception {
    return $ExceptionDataCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$$OnboardingExceptionImpl implements $OnboardingException {
  const _$$OnboardingExceptionImpl(
      {final List<SurveyQuestion> surveyQuestions = const [],
      final List<OnboardingInfo> onboardingInfo = const [],
      required this.exception})
      : _surveyQuestions = surveyQuestions,
        _onboardingInfo = onboardingInfo;

  final List<SurveyQuestion> _surveyQuestions;
  @override
  @JsonKey()
  List<SurveyQuestion> get surveyQuestions {
    if (_surveyQuestions is EqualUnmodifiableListView) return _surveyQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveyQuestions);
  }

  final List<OnboardingInfo> _onboardingInfo;
  @override
  @JsonKey()
  List<OnboardingInfo> get onboardingInfo {
    if (_onboardingInfo is EqualUnmodifiableListView) return _onboardingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onboardingInfo);
  }

  @override
  final ExceptionData exception;

  @override
  String toString() {
    return 'OnboardingState.exception(surveyQuestions: $surveyQuestions, onboardingInfo: $onboardingInfo, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$OnboardingExceptionImpl &&
            const DeepCollectionEquality()
                .equals(other._surveyQuestions, _surveyQuestions) &&
            const DeepCollectionEquality()
                .equals(other._onboardingInfo, _onboardingInfo) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyQuestions),
      const DeepCollectionEquality().hash(_onboardingInfo),
      exception);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$OnboardingExceptionImplCopyWith<_$$OnboardingExceptionImpl>
      get copyWith =>
          __$$$OnboardingExceptionImplCopyWithImpl<_$$OnboardingExceptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        idle,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        loading,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)
        exception,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        completed,
  }) {
    return exception(surveyQuestions, onboardingInfo, this.exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
  }) {
    return exception?.call(surveyQuestions, onboardingInfo, this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(surveyQuestions, onboardingInfo, this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($OnboardingIdle value) idle,
    required TResult Function($OnboardingLoading value) loading,
    required TResult Function($OnboardingException value) exception,
    required TResult Function($OnboardingCompleted value) completed,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($OnboardingIdle value)? idle,
    TResult? Function($OnboardingLoading value)? loading,
    TResult? Function($OnboardingException value)? exception,
    TResult? Function($OnboardingCompleted value)? completed,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($OnboardingIdle value)? idle,
    TResult Function($OnboardingLoading value)? loading,
    TResult Function($OnboardingException value)? exception,
    TResult Function($OnboardingCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class $OnboardingException implements OnboardingState {
  const factory $OnboardingException(
      {final List<SurveyQuestion> surveyQuestions,
      final List<OnboardingInfo> onboardingInfo,
      required final ExceptionData exception}) = _$$OnboardingExceptionImpl;

  @override
  List<SurveyQuestion> get surveyQuestions;
  @override
  List<OnboardingInfo> get onboardingInfo;
  ExceptionData get exception;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$OnboardingExceptionImplCopyWith<_$$OnboardingExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$OnboardingCompletedImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$$OnboardingCompletedImplCopyWith(_$$OnboardingCompletedImpl value,
          $Res Function(_$$OnboardingCompletedImpl) then) =
      __$$$OnboardingCompletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SurveyQuestion> surveyQuestions,
      List<OnboardingInfo> onboardingInfo});
}

/// @nodoc
class __$$$OnboardingCompletedImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$$OnboardingCompletedImpl>
    implements _$$$OnboardingCompletedImplCopyWith<$Res> {
  __$$$OnboardingCompletedImplCopyWithImpl(_$$OnboardingCompletedImpl _value,
      $Res Function(_$$OnboardingCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surveyQuestions = null,
    Object? onboardingInfo = null,
  }) {
    return _then(_$$OnboardingCompletedImpl(
      surveyQuestions: null == surveyQuestions
          ? _value._surveyQuestions
          : surveyQuestions // ignore: cast_nullable_to_non_nullable
              as List<SurveyQuestion>,
      onboardingInfo: null == onboardingInfo
          ? _value._onboardingInfo
          : onboardingInfo // ignore: cast_nullable_to_non_nullable
              as List<OnboardingInfo>,
    ));
  }
}

/// @nodoc

class _$$OnboardingCompletedImpl implements $OnboardingCompleted {
  const _$$OnboardingCompletedImpl(
      {final List<SurveyQuestion> surveyQuestions = const [],
      final List<OnboardingInfo> onboardingInfo = const []})
      : _surveyQuestions = surveyQuestions,
        _onboardingInfo = onboardingInfo;

  final List<SurveyQuestion> _surveyQuestions;
  @override
  @JsonKey()
  List<SurveyQuestion> get surveyQuestions {
    if (_surveyQuestions is EqualUnmodifiableListView) return _surveyQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveyQuestions);
  }

  final List<OnboardingInfo> _onboardingInfo;
  @override
  @JsonKey()
  List<OnboardingInfo> get onboardingInfo {
    if (_onboardingInfo is EqualUnmodifiableListView) return _onboardingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onboardingInfo);
  }

  @override
  String toString() {
    return 'OnboardingState.completed(surveyQuestions: $surveyQuestions, onboardingInfo: $onboardingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$OnboardingCompletedImpl &&
            const DeepCollectionEquality()
                .equals(other._surveyQuestions, _surveyQuestions) &&
            const DeepCollectionEquality()
                .equals(other._onboardingInfo, _onboardingInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_surveyQuestions),
      const DeepCollectionEquality().hash(_onboardingInfo));

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$OnboardingCompletedImplCopyWith<_$$OnboardingCompletedImpl>
      get copyWith =>
          __$$$OnboardingCompletedImplCopyWithImpl<_$$OnboardingCompletedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        idle,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        loading,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)
        exception,
    required TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)
        completed,
  }) {
    return completed(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult? Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
  }) {
    return completed?.call(surveyQuestions, onboardingInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        idle,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        loading,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo, ExceptionData exception)?
        exception,
    TResult Function(List<SurveyQuestion> surveyQuestions,
            List<OnboardingInfo> onboardingInfo)?
        completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(surveyQuestions, onboardingInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($OnboardingIdle value) idle,
    required TResult Function($OnboardingLoading value) loading,
    required TResult Function($OnboardingException value) exception,
    required TResult Function($OnboardingCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($OnboardingIdle value)? idle,
    TResult? Function($OnboardingLoading value)? loading,
    TResult? Function($OnboardingException value)? exception,
    TResult? Function($OnboardingCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($OnboardingIdle value)? idle,
    TResult Function($OnboardingLoading value)? loading,
    TResult Function($OnboardingException value)? exception,
    TResult Function($OnboardingCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class $OnboardingCompleted implements OnboardingState {
  const factory $OnboardingCompleted(
      {final List<SurveyQuestion> surveyQuestions,
      final List<OnboardingInfo> onboardingInfo}) = _$$OnboardingCompletedImpl;

  @override
  List<SurveyQuestion> get surveyQuestions;
  @override
  List<OnboardingInfo> get onboardingInfo;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$OnboardingCompletedImplCopyWith<_$$OnboardingCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
