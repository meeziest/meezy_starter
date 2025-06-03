// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileContentDto _$FileContentDtoFromJson(Map<String, dynamic> json) {
  return _FileContentDto.fromJson(json);
}

/// @nodoc
mixin _$FileContentDto {
  @JsonKey(name: 'file_id')
  String get fileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_type')
  String get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_name')
  String? get fileName => throw _privateConstructorUsedError;
  String? get base64 => throw _privateConstructorUsedError;

  /// Serializes this FileContentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileContentDtoCopyWith<FileContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileContentDtoCopyWith<$Res> {
  factory $FileContentDtoCopyWith(
          FileContentDto value, $Res Function(FileContentDto) then) =
      _$FileContentDtoCopyWithImpl<$Res, FileContentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'file_id') String fileId,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_name') String? fileName,
      String? base64});
}

/// @nodoc
class _$FileContentDtoCopyWithImpl<$Res, $Val extends FileContentDto>
    implements $FileContentDtoCopyWith<$Res> {
  _$FileContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? fileType = null,
    Object? fileName = freezed,
    Object? base64 = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      base64: freezed == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileContentDtoImplCopyWith<$Res>
    implements $FileContentDtoCopyWith<$Res> {
  factory _$$FileContentDtoImplCopyWith(_$FileContentDtoImpl value,
          $Res Function(_$FileContentDtoImpl) then) =
      __$$FileContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'file_id') String fileId,
      @JsonKey(name: 'file_type') String fileType,
      @JsonKey(name: 'file_name') String? fileName,
      String? base64});
}

/// @nodoc
class __$$FileContentDtoImplCopyWithImpl<$Res>
    extends _$FileContentDtoCopyWithImpl<$Res, _$FileContentDtoImpl>
    implements _$$FileContentDtoImplCopyWith<$Res> {
  __$$FileContentDtoImplCopyWithImpl(
      _$FileContentDtoImpl _value, $Res Function(_$FileContentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? fileType = null,
    Object? fileName = freezed,
    Object? base64 = freezed,
  }) {
    return _then(_$FileContentDtoImpl(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      base64: freezed == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileContentDtoImpl implements _FileContentDto {
  const _$FileContentDtoImpl(
      {@JsonKey(name: 'file_id') required this.fileId,
      @JsonKey(name: 'file_type') required this.fileType,
      @JsonKey(name: 'file_name') this.fileName,
      this.base64});

  factory _$FileContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileContentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'file_id')
  final String fileId;
  @override
  @JsonKey(name: 'file_type')
  final String fileType;
  @override
  @JsonKey(name: 'file_name')
  final String? fileName;
  @override
  final String? base64;

  @override
  String toString() {
    return 'FileContentDto(fileId: $fileId, fileType: $fileType, fileName: $fileName, base64: $base64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileContentDtoImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.base64, base64) || other.base64 == base64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fileId, fileType, fileName, base64);

  /// Create a copy of FileContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileContentDtoImplCopyWith<_$FileContentDtoImpl> get copyWith =>
      __$$FileContentDtoImplCopyWithImpl<_$FileContentDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileContentDtoImplToJson(
      this,
    );
  }
}

abstract class _FileContentDto implements FileContentDto {
  const factory _FileContentDto(
      {@JsonKey(name: 'file_id') required final String fileId,
      @JsonKey(name: 'file_type') required final String fileType,
      @JsonKey(name: 'file_name') final String? fileName,
      final String? base64}) = _$FileContentDtoImpl;

  factory _FileContentDto.fromJson(Map<String, dynamic> json) =
      _$FileContentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'file_id')
  String get fileId;
  @override
  @JsonKey(name: 'file_type')
  String get fileType;
  @override
  @JsonKey(name: 'file_name')
  String? get fileName;
  @override
  String? get base64;

  /// Create a copy of FileContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileContentDtoImplCopyWith<_$FileContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
