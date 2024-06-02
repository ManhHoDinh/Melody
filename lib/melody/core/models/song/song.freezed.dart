// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  String get songId => throw _privateConstructorUsedError;
  String get artistId => throw _privateConstructorUsedError;
  String get songName => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String get songImagePath => throw _privateConstructorUsedError;
  @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
  List<DateTime> get times => throw _privateConstructorUsedError;
  List<String> get commentsIds => throw _privateConstructorUsedError;
  String get audioPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call(
      {String songId,
      String artistId,
      String songName,
      String artistName,
      String songImagePath,
      @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
      List<DateTime> times,
      List<String> commentsIds,
      String audioPath});
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? artistId = null,
    Object? songName = null,
    Object? artistName = null,
    Object? songImagePath = null,
    Object? times = null,
    Object? commentsIds = null,
    Object? audioPath = null,
  }) {
    return _then(_value.copyWith(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      songImagePath: null == songImagePath
          ? _value.songImagePath
          : songImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      commentsIds: null == commentsIds
          ? _value.commentsIds
          : commentsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongImplCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$SongImplCopyWith(
          _$SongImpl value, $Res Function(_$SongImpl) then) =
      __$$SongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String songId,
      String artistId,
      String songName,
      String artistName,
      String songImagePath,
      @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
      List<DateTime> times,
      List<String> commentsIds,
      String audioPath});
}

/// @nodoc
class __$$SongImplCopyWithImpl<$Res>
    extends _$SongCopyWithImpl<$Res, _$SongImpl>
    implements _$$SongImplCopyWith<$Res> {
  __$$SongImplCopyWithImpl(_$SongImpl _value, $Res Function(_$SongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? artistId = null,
    Object? songName = null,
    Object? artistName = null,
    Object? songImagePath = null,
    Object? times = null,
    Object? commentsIds = null,
    Object? audioPath = null,
  }) {
    return _then(_$SongImpl(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      songImagePath: null == songImagePath
          ? _value.songImagePath
          : songImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      times: null == times
          ? _value._times
          : times // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      commentsIds: null == commentsIds
          ? _value._commentsIds
          : commentsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongImpl implements _Song {
  const _$SongImpl(
      {required this.songId,
      this.artistId = "",
      this.songName = "",
      this.artistName = "",
      this.songImagePath = "",
      @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
      final List<DateTime> times = const [],
      final List<String> commentsIds = const [],
      this.audioPath = ""})
      : _times = times,
        _commentsIds = commentsIds;

  factory _$SongImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongImplFromJson(json);

  @override
  final String songId;
  @override
  @JsonKey()
  final String artistId;
  @override
  @JsonKey()
  final String songName;
  @override
  @JsonKey()
  final String artistName;
  @override
  @JsonKey()
  final String songImagePath;
  final List<DateTime> _times;
  @override
  @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
  List<DateTime> get times {
    if (_times is EqualUnmodifiableListView) return _times;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_times);
  }

  final List<String> _commentsIds;
  @override
  @JsonKey()
  List<String> get commentsIds {
    if (_commentsIds is EqualUnmodifiableListView) return _commentsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsIds);
  }

  @override
  @JsonKey()
  final String audioPath;

  @override
  String toString() {
    return 'Song(songId: $songId, artistId: $artistId, songName: $songName, artistName: $artistName, songImagePath: $songImagePath, times: $times, commentsIds: $commentsIds, audioPath: $audioPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongImpl &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.songImagePath, songImagePath) ||
                other.songImagePath == songImagePath) &&
            const DeepCollectionEquality().equals(other._times, _times) &&
            const DeepCollectionEquality()
                .equals(other._commentsIds, _commentsIds) &&
            (identical(other.audioPath, audioPath) ||
                other.audioPath == audioPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      songId,
      artistId,
      songName,
      artistName,
      songImagePath,
      const DeepCollectionEquality().hash(_times),
      const DeepCollectionEquality().hash(_commentsIds),
      audioPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      __$$SongImplCopyWithImpl<_$SongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongImplToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  const factory _Song(
      {required final String songId,
      final String artistId,
      final String songName,
      final String artistName,
      final String songImagePath,
      @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
      final List<DateTime> times,
      final List<String> commentsIds,
      final String audioPath}) = _$SongImpl;

  factory _Song.fromJson(Map<String, dynamic> json) = _$SongImpl.fromJson;

  @override
  String get songId;
  @override
  String get artistId;
  @override
  String get songName;
  @override
  String get artistName;
  @override
  String get songImagePath;
  @override
  @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
  List<DateTime> get times;
  @override
  List<String> get commentsIds;
  @override
  String get audioPath;
  @override
  @JsonKey(ignore: true)
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
