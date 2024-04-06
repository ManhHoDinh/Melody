// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perfomer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Perfomer _$PerfomerFromJson(Map<String, dynamic> json) {
  return _Perfomer.fromJson(json);
}

/// @nodoc
mixin _$Perfomer {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get music => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerfomerCopyWith<Perfomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerfomerCopyWith<$Res> {
  factory $PerfomerCopyWith(Perfomer value, $Res Function(Perfomer) then) =
      _$PerfomerCopyWithImpl<$Res, Perfomer>;
  @useResult
  $Res call({String name, int id, String music, String image});
}

/// @nodoc
class _$PerfomerCopyWithImpl<$Res, $Val extends Perfomer>
    implements $PerfomerCopyWith<$Res> {
  _$PerfomerCopyWithImpl(this._value, this._then);

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
abstract class _$$PerfomerImplCopyWith<$Res>
    implements $PerfomerCopyWith<$Res> {
  factory _$$PerfomerImplCopyWith(
          _$PerfomerImpl value, $Res Function(_$PerfomerImpl) then) =
      __$$PerfomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String music, String image});
}

/// @nodoc
class __$$PerfomerImplCopyWithImpl<$Res>
    extends _$PerfomerCopyWithImpl<$Res, _$PerfomerImpl>
    implements _$$PerfomerImplCopyWith<$Res> {
  __$$PerfomerImplCopyWithImpl(
      _$PerfomerImpl _value, $Res Function(_$PerfomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? music = null,
    Object? image = null,
  }) {
    return _then(_$PerfomerImpl(
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
class _$PerfomerImpl with DiagnosticableTreeMixin implements _Perfomer {
  const _$PerfomerImpl(
      {required this.name,
      required this.id,
      required this.music,
      required this.image});

  factory _$PerfomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerfomerImplFromJson(json);

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
    return 'Perfomer(name: $name, id: $id, music: $music, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Perfomer'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('music', music))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerfomerImpl &&
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
  _$$PerfomerImplCopyWith<_$PerfomerImpl> get copyWith =>
      __$$PerfomerImplCopyWithImpl<_$PerfomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerfomerImplToJson(
      this,
    );
  }
}

abstract class _Perfomer implements Perfomer {
  const factory _Perfomer(
      {required final String name,
      required final int id,
      required final String music,
      required final String image}) = _$PerfomerImpl;

  factory _Perfomer.fromJson(Map<String, dynamic> json) =
      _$PerfomerImpl.fromJson;

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
  _$$PerfomerImplCopyWith<_$PerfomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
