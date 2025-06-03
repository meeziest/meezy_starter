// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) fetchChats,
    required TResult Function(ChatEntity chat) saveChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? fetchChats,
    TResult? Function(ChatEntity chat)? saveChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? fetchChats,
    TResult Function(ChatEntity chat)? saveChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchChats value) fetchChats,
    required TResult Function(SaveChat value) saveChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchChats value)? fetchChats,
    TResult? Function(SaveChat value)? saveChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchChats value)? fetchChats,
    TResult Function(SaveChat value)? saveChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsEventCopyWith<$Res> {
  factory $ChatsEventCopyWith(
          ChatsEvent value, $Res Function(ChatsEvent) then) =
      _$ChatsEventCopyWithImpl<$Res, ChatsEvent>;
}

/// @nodoc
class _$ChatsEventCopyWithImpl<$Res, $Val extends ChatsEvent>
    implements $ChatsEventCopyWith<$Res> {
  _$ChatsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchChatsImplCopyWith<$Res> {
  factory _$$FetchChatsImplCopyWith(
          _$FetchChatsImpl value, $Res Function(_$FetchChatsImpl) then) =
      __$$FetchChatsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$FetchChatsImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$FetchChatsImpl>
    implements _$$FetchChatsImplCopyWith<$Res> {
  __$$FetchChatsImplCopyWithImpl(
      _$FetchChatsImpl _value, $Res Function(_$FetchChatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$FetchChatsImpl(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchChatsImpl implements FetchChats {
  const _$FetchChatsImpl({required this.userID});

  @override
  final String userID;

  @override
  String toString() {
    return 'ChatsEvent.fetchChats(userID: $userID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChatsImpl &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChatsImplCopyWith<_$FetchChatsImpl> get copyWith =>
      __$$FetchChatsImplCopyWithImpl<_$FetchChatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) fetchChats,
    required TResult Function(ChatEntity chat) saveChat,
  }) {
    return fetchChats(userID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? fetchChats,
    TResult? Function(ChatEntity chat)? saveChat,
  }) {
    return fetchChats?.call(userID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? fetchChats,
    TResult Function(ChatEntity chat)? saveChat,
    required TResult orElse(),
  }) {
    if (fetchChats != null) {
      return fetchChats(userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchChats value) fetchChats,
    required TResult Function(SaveChat value) saveChat,
  }) {
    return fetchChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchChats value)? fetchChats,
    TResult? Function(SaveChat value)? saveChat,
  }) {
    return fetchChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchChats value)? fetchChats,
    TResult Function(SaveChat value)? saveChat,
    required TResult orElse(),
  }) {
    if (fetchChats != null) {
      return fetchChats(this);
    }
    return orElse();
  }
}

abstract class FetchChats implements ChatsEvent {
  const factory FetchChats({required final String userID}) = _$FetchChatsImpl;

  String get userID;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchChatsImplCopyWith<_$FetchChatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveChatImplCopyWith<$Res> {
  factory _$$SaveChatImplCopyWith(
          _$SaveChatImpl value, $Res Function(_$SaveChatImpl) then) =
      __$$SaveChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatEntity chat});
}

/// @nodoc
class __$$SaveChatImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$SaveChatImpl>
    implements _$$SaveChatImplCopyWith<$Res> {
  __$$SaveChatImplCopyWithImpl(
      _$SaveChatImpl _value, $Res Function(_$SaveChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
  }) {
    return _then(_$SaveChatImpl(
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatEntity,
    ));
  }
}

/// @nodoc

class _$SaveChatImpl implements SaveChat {
  const _$SaveChatImpl({required this.chat});

  @override
  final ChatEntity chat;

  @override
  String toString() {
    return 'ChatsEvent.saveChat(chat: $chat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveChatImpl &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chat);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveChatImplCopyWith<_$SaveChatImpl> get copyWith =>
      __$$SaveChatImplCopyWithImpl<_$SaveChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) fetchChats,
    required TResult Function(ChatEntity chat) saveChat,
  }) {
    return saveChat(chat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? fetchChats,
    TResult? Function(ChatEntity chat)? saveChat,
  }) {
    return saveChat?.call(chat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? fetchChats,
    TResult Function(ChatEntity chat)? saveChat,
    required TResult orElse(),
  }) {
    if (saveChat != null) {
      return saveChat(chat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchChats value) fetchChats,
    required TResult Function(SaveChat value) saveChat,
  }) {
    return saveChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchChats value)? fetchChats,
    TResult? Function(SaveChat value)? saveChat,
  }) {
    return saveChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchChats value)? fetchChats,
    TResult Function(SaveChat value)? saveChat,
    required TResult orElse(),
  }) {
    if (saveChat != null) {
      return saveChat(this);
    }
    return orElse();
  }
}

abstract class SaveChat implements ChatsEvent {
  const factory SaveChat({required final ChatEntity chat}) = _$SaveChatImpl;

  ChatEntity get chat;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveChatImplCopyWith<_$SaveChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatsState {
  Map<String, ChatEntity> get chats => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, ChatEntity> chats) idle,
    required TResult Function(Map<String, ChatEntity> chats) loading,
    required TResult Function(
            Map<String, ChatEntity> chats, ExceptionData error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, ChatEntity> chats)? idle,
    TResult? Function(Map<String, ChatEntity> chats)? loading,
    TResult? Function(Map<String, ChatEntity> chats, ExceptionData error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, ChatEntity> chats)? idle,
    TResult Function(Map<String, ChatEntity> chats)? loading,
    TResult Function(Map<String, ChatEntity> chats, ExceptionData error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsIdle value) idle,
    required TResult Function(ChatsLoading value) loading,
    required TResult Function(ChatsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsIdle value)? idle,
    TResult? Function(ChatsLoading value)? loading,
    TResult? Function(ChatsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsIdle value)? idle,
    TResult Function(ChatsLoading value)? loading,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatsStateCopyWith<ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res, ChatsState>;
  @useResult
  $Res call({Map<String, ChatEntity> chats});
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res, $Val extends ChatsState>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsIdleImplCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$ChatsIdleImplCopyWith(
          _$ChatsIdleImpl value, $Res Function(_$ChatsIdleImpl) then) =
      __$$ChatsIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, ChatEntity> chats});
}

/// @nodoc
class __$$ChatsIdleImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsIdleImpl>
    implements _$$ChatsIdleImplCopyWith<$Res> {
  __$$ChatsIdleImplCopyWithImpl(
      _$ChatsIdleImpl _value, $Res Function(_$ChatsIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsIdleImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatEntity>,
    ));
  }
}

/// @nodoc

class _$ChatsIdleImpl implements ChatsIdle {
  const _$ChatsIdleImpl({final Map<String, ChatEntity> chats = const {}})
      : _chats = chats;

  final Map<String, ChatEntity> _chats;
  @override
  @JsonKey()
  Map<String, ChatEntity> get chats {
    if (_chats is EqualUnmodifiableMapView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chats);
  }

  @override
  String toString() {
    return 'ChatsState.idle(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsIdleImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsIdleImplCopyWith<_$ChatsIdleImpl> get copyWith =>
      __$$ChatsIdleImplCopyWithImpl<_$ChatsIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, ChatEntity> chats) idle,
    required TResult Function(Map<String, ChatEntity> chats) loading,
    required TResult Function(
            Map<String, ChatEntity> chats, ExceptionData error)
        error,
  }) {
    return idle(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, ChatEntity> chats)? idle,
    TResult? Function(Map<String, ChatEntity> chats)? loading,
    TResult? Function(Map<String, ChatEntity> chats, ExceptionData error)?
        error,
  }) {
    return idle?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, ChatEntity> chats)? idle,
    TResult Function(Map<String, ChatEntity> chats)? loading,
    TResult Function(Map<String, ChatEntity> chats, ExceptionData error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsIdle value) idle,
    required TResult Function(ChatsLoading value) loading,
    required TResult Function(ChatsError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsIdle value)? idle,
    TResult? Function(ChatsLoading value)? loading,
    TResult? Function(ChatsError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsIdle value)? idle,
    TResult Function(ChatsLoading value)? loading,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ChatsIdle implements ChatsState {
  const factory ChatsIdle({final Map<String, ChatEntity> chats}) =
      _$ChatsIdleImpl;

  @override
  Map<String, ChatEntity> get chats;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatsIdleImplCopyWith<_$ChatsIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatsLoadingImplCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$ChatsLoadingImplCopyWith(
          _$ChatsLoadingImpl value, $Res Function(_$ChatsLoadingImpl) then) =
      __$$ChatsLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, ChatEntity> chats});
}

/// @nodoc
class __$$ChatsLoadingImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsLoadingImpl>
    implements _$$ChatsLoadingImplCopyWith<$Res> {
  __$$ChatsLoadingImplCopyWithImpl(
      _$ChatsLoadingImpl _value, $Res Function(_$ChatsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsLoadingImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatEntity>,
    ));
  }
}

/// @nodoc

class _$ChatsLoadingImpl implements ChatsLoading {
  const _$ChatsLoadingImpl({final Map<String, ChatEntity> chats = const {}})
      : _chats = chats;

  final Map<String, ChatEntity> _chats;
  @override
  @JsonKey()
  Map<String, ChatEntity> get chats {
    if (_chats is EqualUnmodifiableMapView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chats);
  }

  @override
  String toString() {
    return 'ChatsState.loading(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsLoadingImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsLoadingImplCopyWith<_$ChatsLoadingImpl> get copyWith =>
      __$$ChatsLoadingImplCopyWithImpl<_$ChatsLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, ChatEntity> chats) idle,
    required TResult Function(Map<String, ChatEntity> chats) loading,
    required TResult Function(
            Map<String, ChatEntity> chats, ExceptionData error)
        error,
  }) {
    return loading(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, ChatEntity> chats)? idle,
    TResult? Function(Map<String, ChatEntity> chats)? loading,
    TResult? Function(Map<String, ChatEntity> chats, ExceptionData error)?
        error,
  }) {
    return loading?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, ChatEntity> chats)? idle,
    TResult Function(Map<String, ChatEntity> chats)? loading,
    TResult Function(Map<String, ChatEntity> chats, ExceptionData error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsIdle value) idle,
    required TResult Function(ChatsLoading value) loading,
    required TResult Function(ChatsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsIdle value)? idle,
    TResult? Function(ChatsLoading value)? loading,
    TResult? Function(ChatsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsIdle value)? idle,
    TResult Function(ChatsLoading value)? loading,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatsLoading implements ChatsState {
  const factory ChatsLoading({final Map<String, ChatEntity> chats}) =
      _$ChatsLoadingImpl;

  @override
  Map<String, ChatEntity> get chats;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatsLoadingImplCopyWith<_$ChatsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatsErrorImplCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$ChatsErrorImplCopyWith(
          _$ChatsErrorImpl value, $Res Function(_$ChatsErrorImpl) then) =
      __$$ChatsErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, ChatEntity> chats, ExceptionData error});

  $ExceptionDataCopyWith<$Res> get error;
}

/// @nodoc
class __$$ChatsErrorImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsErrorImpl>
    implements _$$ChatsErrorImplCopyWith<$Res> {
  __$$ChatsErrorImplCopyWithImpl(
      _$ChatsErrorImpl _value, $Res Function(_$ChatsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? error = null,
  }) {
    return _then(_$ChatsErrorImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as Map<String, ChatEntity>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ExceptionData,
    ));
  }

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExceptionDataCopyWith<$Res> get error {
    return $ExceptionDataCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ChatsErrorImpl implements ChatsError {
  const _$ChatsErrorImpl(
      {final Map<String, ChatEntity> chats = const {}, required this.error})
      : _chats = chats;

  final Map<String, ChatEntity> _chats;
  @override
  @JsonKey()
  Map<String, ChatEntity> get chats {
    if (_chats is EqualUnmodifiableMapView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chats);
  }

  @override
  final ExceptionData error;

  @override
  String toString() {
    return 'ChatsState.error(chats: $chats, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsErrorImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chats), error);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsErrorImplCopyWith<_$ChatsErrorImpl> get copyWith =>
      __$$ChatsErrorImplCopyWithImpl<_$ChatsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, ChatEntity> chats) idle,
    required TResult Function(Map<String, ChatEntity> chats) loading,
    required TResult Function(
            Map<String, ChatEntity> chats, ExceptionData error)
        error,
  }) {
    return error(chats, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, ChatEntity> chats)? idle,
    TResult? Function(Map<String, ChatEntity> chats)? loading,
    TResult? Function(Map<String, ChatEntity> chats, ExceptionData error)?
        error,
  }) {
    return error?.call(chats, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, ChatEntity> chats)? idle,
    TResult Function(Map<String, ChatEntity> chats)? loading,
    TResult Function(Map<String, ChatEntity> chats, ExceptionData error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(chats, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsIdle value) idle,
    required TResult Function(ChatsLoading value) loading,
    required TResult Function(ChatsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatsIdle value)? idle,
    TResult? Function(ChatsLoading value)? loading,
    TResult? Function(ChatsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsIdle value)? idle,
    TResult Function(ChatsLoading value)? loading,
    TResult Function(ChatsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatsError implements ChatsState {
  const factory ChatsError(
      {final Map<String, ChatEntity> chats,
      required final ExceptionData error}) = _$ChatsErrorImpl;

  @override
  Map<String, ChatEntity> get chats;
  ExceptionData get error;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatsErrorImplCopyWith<_$ChatsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
