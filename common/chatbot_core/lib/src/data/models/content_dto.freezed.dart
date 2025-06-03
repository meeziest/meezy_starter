// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentDto _$ContentDtoFromJson(Map<String, dynamic> json) {
  return _ContentDto.fromJson(json);
}

/// @nodoc
mixin _$ContentDto {
  String? get text => throw _privateConstructorUsedError;
  List<FileContentDto> get files => throw _privateConstructorUsedError;

  /// Serializes this ContentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentDtoCopyWith<ContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDtoCopyWith<$Res> {
  factory $ContentDtoCopyWith(
          ContentDto value, $Res Function(ContentDto) then) =
      _$ContentDtoCopyWithImpl<$Res, ContentDto>;
  @useResult
  $Res call({String? text, List<FileContentDto> files});
}

/// @nodoc
class _$ContentDtoCopyWithImpl<$Res, $Val extends ContentDto>
    implements $ContentDtoCopyWith<$Res> {
  _$ContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? files = null,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileContentDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentDtoImplCopyWith<$Res>
    implements $ContentDtoCopyWith<$Res> {
  factory _$$ContentDtoImplCopyWith(
          _$ContentDtoImpl value, $Res Function(_$ContentDtoImpl) then) =
      __$$ContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, List<FileContentDto> files});
}

/// @nodoc
class __$$ContentDtoImplCopyWithImpl<$Res>
    extends _$ContentDtoCopyWithImpl<$Res, _$ContentDtoImpl>
    implements _$$ContentDtoImplCopyWith<$Res> {
  __$$ContentDtoImplCopyWithImpl(
      _$ContentDtoImpl _value, $Res Function(_$ContentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? files = null,
  }) {
    return _then(_$ContentDtoImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileContentDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentDtoImpl implements _ContentDto {
  const _$ContentDtoImpl(
      {required this.text, required final List<FileContentDto> files})
      : _files = files;

  factory _$ContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentDtoImplFromJson(json);

  @override
  final String? text;
  final List<FileContentDto> _files;
  @override
  List<FileContentDto> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'ContentDto(text: $text, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentDtoImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_files));

  /// Create a copy of ContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentDtoImplCopyWith<_$ContentDtoImpl> get copyWith =>
      __$$ContentDtoImplCopyWithImpl<_$ContentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentDtoImplToJson(
      this,
    );
  }
}

abstract class _ContentDto implements ContentDto {
  const factory _ContentDto(
      {required final String? text,
      required final List<FileContentDto> files}) = _$ContentDtoImpl;

  factory _ContentDto.fromJson(Map<String, dynamic> json) =
      _$ContentDtoImpl.fromJson;

  @override
  String? get text;
  @override
  List<FileContentDto> get files;

  /// Create a copy of ContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentDtoImplCopyWith<_$ContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
