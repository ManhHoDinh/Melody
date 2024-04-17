// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instrument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Instrument _$InstrumentFromJson(Map<String, dynamic> json) {
  return _Instrument.fromJson(json);
}

/// @nodoc
mixin _$Instrument {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstrumentCopyWith<Instrument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentCopyWith<$Res> {
  factory $InstrumentCopyWith(
          Instrument value, $Res Function(Instrument) then) =
      _$InstrumentCopyWithImpl<$Res, Instrument>;
  @useResult
  $Res call({String name, String id, String description, String image});
}

/// @nodoc
class _$InstrumentCopyWithImpl<$Res, $Val extends Instrument>
    implements $InstrumentCopyWith<$Res> {
  _$InstrumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? description = null,
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
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstrumentImplCopyWith<$Res>
    implements $InstrumentCopyWith<$Res> {
  factory _$$InstrumentImplCopyWith(
          _$InstrumentImpl value, $Res Function(_$InstrumentImpl) then) =
      __$$InstrumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, String description, String image});
}

/// @nodoc
class __$$InstrumentImplCopyWithImpl<$Res>
    extends _$InstrumentCopyWithImpl<$Res, _$InstrumentImpl>
    implements _$$InstrumentImplCopyWith<$Res> {
  __$$InstrumentImplCopyWithImpl(
      _$InstrumentImpl _value, $Res Function(_$InstrumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$InstrumentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$InstrumentImpl implements _Instrument {
  const _$InstrumentImpl(
      {required this.name,
      required this.id,
      required this.description,
      required this.image});

  factory _$InstrumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstrumentImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'Instrument(name: $name, id: $id, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstrumentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstrumentImplCopyWith<_$InstrumentImpl> get copyWith =>
      __$$InstrumentImplCopyWithImpl<_$InstrumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstrumentImplToJson(
      this,
    );
  }
}

abstract class _Instrument implements Instrument {
  const factory _Instrument(
      {required final String name,
      required final String id,
      required final String description,
      required final String image}) = _$InstrumentImpl;

  factory _Instrument.fromJson(Map<String, dynamic> json) =
      _$InstrumentImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$InstrumentImplCopyWith<_$InstrumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}