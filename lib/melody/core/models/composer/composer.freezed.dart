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
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get music => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

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
  $Res call({String name, int id, String music, String image});
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
    Object? name = null,
    Object? id = null,
    Object? music = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      music: null == music
          ? _value.music
          : music // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
  $Res call({String name, int id, String music, String image});
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
    Object? name = null,
    Object? id = null,
    Object? music = null,
    Object? image = null,
  }) {
    return _then(_$ComposerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      music: null == music
          ? _value.music
          : music // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComposerImpl with DiagnosticableTreeMixin implements _Composer {
  const _$ComposerImpl(
      {required this.name,
      required this.id,
      required this.music,
      required this.image});

  factory _$ComposerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComposerImplFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final String music;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Composer(name: $name, id: $id, music: $music, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Composer'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('music', music))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComposerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.music, music) || other.music == music) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, music, image);

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
      {required final String name,
      required final int id,
      required final String music,
      required final String image}) = _$ComposerImpl;

  factory _Composer.fromJson(Map<String, dynamic> json) =
      _$ComposerImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  String get music;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ComposerImplCopyWith<_$ComposerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
