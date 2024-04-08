// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instrumentModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstrumentModel _$InstrumentModelFromJson(Map<String, dynamic> json) {
  return _InstrumentModel.fromJson(json);
}

/// @nodoc
mixin _$InstrumentModel {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstrumentModelCopyWith<InstrumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentModelCopyWith<$Res> {
  factory $InstrumentModelCopyWith(
          InstrumentModel value, $Res Function(InstrumentModel) then) =
      _$InstrumentModelCopyWithImpl<$Res, InstrumentModel>;
  @useResult
  $Res call({String name, String id, String description, String image});
}

/// @nodoc
class _$InstrumentModelCopyWithImpl<$Res, $Val extends InstrumentModel>
    implements $InstrumentModelCopyWith<$Res> {
  _$InstrumentModelCopyWithImpl(this._value, this._then);

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
abstract class _$$InstrumentModelImplCopyWith<$Res>
    implements $InstrumentModelCopyWith<$Res> {
  factory _$$InstrumentModelImplCopyWith(_$InstrumentModelImpl value,
          $Res Function(_$InstrumentModelImpl) then) =
      __$$InstrumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, String description, String image});
}

/// @nodoc
class __$$InstrumentModelImplCopyWithImpl<$Res>
    extends _$InstrumentModelCopyWithImpl<$Res, _$InstrumentModelImpl>
    implements _$$InstrumentModelImplCopyWith<$Res> {
  __$$InstrumentModelImplCopyWithImpl(
      _$InstrumentModelImpl _value, $Res Function(_$InstrumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$InstrumentModelImpl(
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
class _$InstrumentModelImpl
    with DiagnosticableTreeMixin
    implements _InstrumentModel {
  const _$InstrumentModelImpl(
      {required this.name,
      required this.id,
      required this.description,
      required this.image});

  factory _$InstrumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstrumentModelImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InstrumentModel(name: $name, id: $id, description: $description, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InstrumentModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstrumentModelImpl &&
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
  _$$InstrumentModelImplCopyWith<_$InstrumentModelImpl> get copyWith =>
      __$$InstrumentModelImplCopyWithImpl<_$InstrumentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstrumentModelImplToJson(
      this,
    );
  }
}

abstract class _InstrumentModel implements InstrumentModel {
  const factory _InstrumentModel(
      {required final String name,
      required final String id,
      required final String description,
      required final String image}) = _$InstrumentModelImpl;

  factory _InstrumentModel.fromJson(Map<String, dynamic> json) =
      _$InstrumentModelImpl.fromJson;

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
  _$$InstrumentModelImplCopyWith<_$InstrumentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
