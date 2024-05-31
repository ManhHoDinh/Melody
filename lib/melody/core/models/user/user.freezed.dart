// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get Id => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get Email => throw _privateConstructorUsedError;
  List<String> get playlistIds => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  List<String> get songIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String Id,
      String Name,
      String Email,
      List<String> playlistIds,
      String position,
      List<String> songIds});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Id = null,
    Object? Name = null,
    Object? Email = null,
    Object? playlistIds = null,
    Object? position = null,
    Object? songIds = null,
  }) {
    return _then(_value.copyWith(
      Id: null == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      playlistIds: null == playlistIds
          ? _value.playlistIds
          : playlistIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      songIds: null == songIds
          ? _value.songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Id,
      String Name,
      String Email,
      List<String> playlistIds,
      String position,
      List<String> songIds});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Id = null,
    Object? Name = null,
    Object? Email = null,
    Object? playlistIds = null,
    Object? position = null,
    Object? songIds = null,
  }) {
    return _then(_$UserModelImpl(
      Id: null == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      playlistIds: null == playlistIds
          ? _value._playlistIds
          : playlistIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      songIds: null == songIds
          ? _value._songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  _$UserModelImpl(
      {required this.Id,
      required this.Name,
      required this.Email,
      final List<String> playlistIds = const [],
      this.position = "",
      final List<String> songIds = const []})
      : _playlistIds = playlistIds,
        _songIds = songIds;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String Id;
  @override
  final String Name;
  @override
  final String Email;
  final List<String> _playlistIds;
  @override
  @JsonKey()
  List<String> get playlistIds {
    if (_playlistIds is EqualUnmodifiableListView) return _playlistIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlistIds);
  }

  @override
  @JsonKey()
  final String position;
  final List<String> _songIds;
  @override
  @JsonKey()
  List<String> get songIds {
    if (_songIds is EqualUnmodifiableListView) return _songIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(Id: $Id, Name: $Name, Email: $Email, playlistIds: $playlistIds, position: $position, songIds: $songIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('Id', Id))
      ..add(DiagnosticsProperty('Name', Name))
      ..add(DiagnosticsProperty('Email', Email))
      ..add(DiagnosticsProperty('playlistIds', playlistIds))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('songIds', songIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Email, Email) || other.Email == Email) &&
            const DeepCollectionEquality()
                .equals(other._playlistIds, _playlistIds) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality().equals(other._songIds, _songIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      Id,
      Name,
      Email,
      const DeepCollectionEquality().hash(_playlistIds),
      position,
      const DeepCollectionEquality().hash(_songIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String Id,
      required final String Name,
      required final String Email,
      final List<String> playlistIds,
      final String position,
      final List<String> songIds}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get Id;
  @override
  String get Name;
  @override
  String get Email;
  @override
  List<String> get playlistIds;
  @override
  String get position;
  @override
  List<String> get songIds;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
