// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'composer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Composer _$ComposerFromJson(Map<String, dynamic> json) {
  return _Composer.fromJson(json);
}

/// @nodoc
mixin _$Composer {
  String get composerId => throw _privateConstructorUsedError;
  String get composerName => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get portrait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComposerCopyWith<Composer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposerCopyWith<$Res> {
  factory $ComposerCopyWith(Composer value, $Res Function(Composer) then) =
      _$ComposerCopyWithImpl<$Res, Composer>;
  @useResult
  $Res call(
      {String composerId, String composerName, String about, String portrait});
}

/// @nodoc
class _$ComposerCopyWithImpl<$Res, $Val extends Composer>
    implements $ComposerCopyWith<$Res> {
  _$ComposerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? composerId = null,
    Object? composerName = null,
    Object? about = null,
    Object? portrait = null,
  }) {
    return _then(_value.copyWith(
      composerId: null == composerId
          ? _value.composerId
          : composerId // ignore: cast_nullable_to_non_nullable
              as String,
      composerName: null == composerName
          ? _value.composerName
          : composerName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComposerImplCopyWith<$Res>
    implements $ComposerCopyWith<$Res> {
  factory _$$ComposerImplCopyWith(
          _$ComposerImpl value, $Res Function(_$ComposerImpl) then) =
      __$$ComposerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String composerId, String composerName, String about, String portrait});
}

/// @nodoc
class __$$ComposerImplCopyWithImpl<$Res>
    extends _$ComposerCopyWithImpl<$Res, _$ComposerImpl>
    implements _$$ComposerImplCopyWith<$Res> {
  __$$ComposerImplCopyWithImpl(
      _$ComposerImpl _value, $Res Function(_$ComposerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? composerId = null,
    Object? composerName = null,
    Object? about = null,
    Object? portrait = null,
  }) {
    return _then(_$ComposerImpl(
      composerId: null == composerId
          ? _value.composerId
          : composerId // ignore: cast_nullable_to_non_nullable
              as String,
      composerName: null == composerName
          ? _value.composerName
          : composerName // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComposerImpl with DiagnosticableTreeMixin implements _Composer {
  const _$ComposerImpl(
      {required this.composerId,
      required this.composerName,
      required this.about,
      required this.portrait});

  factory _$ComposerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComposerImplFromJson(json);

  @override
  final String composerId;
  @override
  final String composerName;
  @override
  final String about;
  @override
  final String portrait;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Composer(composerId: $composerId, composerName: $composerName, about: $about, portrait: $portrait)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Composer'))
      ..add(DiagnosticsProperty('composerId', composerId))
      ..add(DiagnosticsProperty('composerName', composerName))
      ..add(DiagnosticsProperty('about', about))
      ..add(DiagnosticsProperty('portrait', portrait));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComposerImpl &&
            (identical(other.composerId, composerId) ||
                other.composerId == composerId) &&
            (identical(other.composerName, composerName) ||
                other.composerName == composerName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.portrait, portrait) ||
                other.portrait == portrait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, composerId, composerName, about, portrait);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComposerImplCopyWith<_$ComposerImpl> get copyWith =>
      __$$ComposerImplCopyWithImpl<_$ComposerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComposerImplToJson(
      this,
    );
  }
}

abstract class _Composer implements Composer {
  const factory _Composer(
      {required final String composerId,
      required final String composerName,
      required final String about,
      required final String portrait}) = _$ComposerImpl;

  factory _Composer.fromJson(Map<String, dynamic> json) =
      _$ComposerImpl.fromJson;

  @override
  String get composerId;
  @override
  String get composerName;
  @override
  String get about;
  @override
  String get portrait;
  @override
  @JsonKey(ignore: true)
  _$$ComposerImplCopyWith<_$ComposerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
