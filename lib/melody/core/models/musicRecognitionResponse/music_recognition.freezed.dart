// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_recognition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MusicRecognitionResponse _$MusicRecognitionResponseFromJson(
    Map<String, dynamic> json) {
  return _MusicRecognitionResponse.fromJson(json);
}

/// @nodoc
mixin _$MusicRecognitionResponse {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  Result? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicRecognitionResponseCopyWith<MusicRecognitionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicRecognitionResponseCopyWith<$Res> {
  factory $MusicRecognitionResponseCopyWith(MusicRecognitionResponse value,
          $Res Function(MusicRecognitionResponse) then) =
      _$MusicRecognitionResponseCopyWithImpl<$Res, MusicRecognitionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'result') Result? result});

  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$MusicRecognitionResponseCopyWithImpl<$Res,
        $Val extends MusicRecognitionResponse>
    implements $MusicRecognitionResponseCopyWith<$Res> {
  _$MusicRecognitionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MusicRecognitionResponseImplCopyWith<$Res>
    implements $MusicRecognitionResponseCopyWith<$Res> {
  factory _$$MusicRecognitionResponseImplCopyWith(
          _$MusicRecognitionResponseImpl value,
          $Res Function(_$MusicRecognitionResponseImpl) then) =
      __$$MusicRecognitionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'result') Result? result});

  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$MusicRecognitionResponseImplCopyWithImpl<$Res>
    extends _$MusicRecognitionResponseCopyWithImpl<$Res,
        _$MusicRecognitionResponseImpl>
    implements _$$MusicRecognitionResponseImplCopyWith<$Res> {
  __$$MusicRecognitionResponseImplCopyWithImpl(
      _$MusicRecognitionResponseImpl _value,
      $Res Function(_$MusicRecognitionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? result = freezed,
  }) {
    return _then(_$MusicRecognitionResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicRecognitionResponseImpl
    with DiagnosticableTreeMixin
    implements _MusicRecognitionResponse {
  const _$MusicRecognitionResponseImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'result') this.result});

  factory _$MusicRecognitionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicRecognitionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'result')
  final Result? result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MusicRecognitionResponse(status: $status, result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MusicRecognitionResponse'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicRecognitionResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicRecognitionResponseImplCopyWith<_$MusicRecognitionResponseImpl>
      get copyWith => __$$MusicRecognitionResponseImplCopyWithImpl<
          _$MusicRecognitionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicRecognitionResponseImplToJson(
      this,
    );
  }
}

abstract class _MusicRecognitionResponse implements MusicRecognitionResponse {
  const factory _MusicRecognitionResponse(
          {@JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'result') final Result? result}) =
      _$MusicRecognitionResponseImpl;

  factory _MusicRecognitionResponse.fromJson(Map<String, dynamic> json) =
      _$MusicRecognitionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'result')
  Result? get result;
  @override
  @JsonKey(ignore: true)
  _$$MusicRecognitionResponseImplCopyWith<_$MusicRecognitionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  @JsonKey(name: 'artist')
  String? get artist => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'album')
  String? get album => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'timecode')
  String? get timecode => throw _privateConstructorUsedError;
  @JsonKey(name: 'song_link')
  String? get songLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'apple_music')
  AppleMusic? get appleMusic => throw _privateConstructorUsedError;
  @JsonKey(name: 'spotify')
  Spotify? get spotify => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {@JsonKey(name: 'artist') String? artist,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'album') String? album,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'timecode') String? timecode,
      @JsonKey(name: 'song_link') String? songLink,
      @JsonKey(name: 'apple_music') AppleMusic? appleMusic,
      @JsonKey(name: 'spotify') Spotify? spotify});

  $AppleMusicCopyWith<$Res>? get appleMusic;
  $SpotifyCopyWith<$Res>? get spotify;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = freezed,
    Object? title = freezed,
    Object? album = freezed,
    Object? releaseDate = freezed,
    Object? label = freezed,
    Object? timecode = freezed,
    Object? songLink = freezed,
    Object? appleMusic = freezed,
    Object? spotify = freezed,
  }) {
    return _then(_value.copyWith(
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      timecode: freezed == timecode
          ? _value.timecode
          : timecode // ignore: cast_nullable_to_non_nullable
              as String?,
      songLink: freezed == songLink
          ? _value.songLink
          : songLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appleMusic: freezed == appleMusic
          ? _value.appleMusic
          : appleMusic // ignore: cast_nullable_to_non_nullable
              as AppleMusic?,
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as Spotify?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppleMusicCopyWith<$Res>? get appleMusic {
    if (_value.appleMusic == null) {
      return null;
    }

    return $AppleMusicCopyWith<$Res>(_value.appleMusic!, (value) {
      return _then(_value.copyWith(appleMusic: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SpotifyCopyWith<$Res>? get spotify {
    if (_value.spotify == null) {
      return null;
    }

    return $SpotifyCopyWith<$Res>(_value.spotify!, (value) {
      return _then(_value.copyWith(spotify: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'artist') String? artist,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'album') String? album,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'timecode') String? timecode,
      @JsonKey(name: 'song_link') String? songLink,
      @JsonKey(name: 'apple_music') AppleMusic? appleMusic,
      @JsonKey(name: 'spotify') Spotify? spotify});

  @override
  $AppleMusicCopyWith<$Res>? get appleMusic;
  @override
  $SpotifyCopyWith<$Res>? get spotify;
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = freezed,
    Object? title = freezed,
    Object? album = freezed,
    Object? releaseDate = freezed,
    Object? label = freezed,
    Object? timecode = freezed,
    Object? songLink = freezed,
    Object? appleMusic = freezed,
    Object? spotify = freezed,
  }) {
    return _then(_$ResultImpl(
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      timecode: freezed == timecode
          ? _value.timecode
          : timecode // ignore: cast_nullable_to_non_nullable
              as String?,
      songLink: freezed == songLink
          ? _value.songLink
          : songLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appleMusic: freezed == appleMusic
          ? _value.appleMusic
          : appleMusic // ignore: cast_nullable_to_non_nullable
              as AppleMusic?,
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as Spotify?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl with DiagnosticableTreeMixin implements _Result {
  const _$ResultImpl(
      {@JsonKey(name: 'artist') this.artist,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'album') this.album,
      @JsonKey(name: 'release_date') this.releaseDate,
      @JsonKey(name: 'label') this.label,
      @JsonKey(name: 'timecode') this.timecode,
      @JsonKey(name: 'song_link') this.songLink,
      @JsonKey(name: 'apple_music') this.appleMusic,
      @JsonKey(name: 'spotify') this.spotify});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  @JsonKey(name: 'artist')
  final String? artist;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'album')
  final String? album;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  @JsonKey(name: 'label')
  final String? label;
  @override
  @JsonKey(name: 'timecode')
  final String? timecode;
  @override
  @JsonKey(name: 'song_link')
  final String? songLink;
  @override
  @JsonKey(name: 'apple_music')
  final AppleMusic? appleMusic;
  @override
  @JsonKey(name: 'spotify')
  final Spotify? spotify;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result(artist: $artist, title: $title, album: $album, releaseDate: $releaseDate, label: $label, timecode: $timecode, songLink: $songLink, appleMusic: $appleMusic, spotify: $spotify)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result'))
      ..add(DiagnosticsProperty('artist', artist))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('album', album))
      ..add(DiagnosticsProperty('releaseDate', releaseDate))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('timecode', timecode))
      ..add(DiagnosticsProperty('songLink', songLink))
      ..add(DiagnosticsProperty('appleMusic', appleMusic))
      ..add(DiagnosticsProperty('spotify', spotify));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.timecode, timecode) ||
                other.timecode == timecode) &&
            (identical(other.songLink, songLink) ||
                other.songLink == songLink) &&
            (identical(other.appleMusic, appleMusic) ||
                other.appleMusic == appleMusic) &&
            (identical(other.spotify, spotify) || other.spotify == spotify));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artist, title, album,
      releaseDate, label, timecode, songLink, appleMusic, spotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {@JsonKey(name: 'artist') final String? artist,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'album') final String? album,
      @JsonKey(name: 'release_date') final String? releaseDate,
      @JsonKey(name: 'label') final String? label,
      @JsonKey(name: 'timecode') final String? timecode,
      @JsonKey(name: 'song_link') final String? songLink,
      @JsonKey(name: 'apple_music') final AppleMusic? appleMusic,
      @JsonKey(name: 'spotify') final Spotify? spotify}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  @JsonKey(name: 'artist')
  String? get artist;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'album')
  String? get album;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  @JsonKey(name: 'label')
  String? get label;
  @override
  @JsonKey(name: 'timecode')
  String? get timecode;
  @override
  @JsonKey(name: 'song_link')
  String? get songLink;
  @override
  @JsonKey(name: 'apple_music')
  AppleMusic? get appleMusic;
  @override
  @JsonKey(name: 'spotify')
  Spotify? get spotify;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppleMusic _$AppleMusicFromJson(Map<String, dynamic> json) {
  return _AppleMusic.fromJson(json);
}

/// @nodoc
mixin _$AppleMusic {
  @JsonKey(name: 'previews')
  List<Previews>? get previews => throw _privateConstructorUsedError;
  @JsonKey(name: 'artwork')
  Artwork? get artwork => throw _privateConstructorUsedError;
  @JsonKey(name: 'artistName')
  String? get artistName => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'discNumber')
  int? get discNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'genreNames')
  List<String>? get genreNames => throw _privateConstructorUsedError;
  @JsonKey(name: 'durationInMillis')
  int? get durationInMillis => throw _privateConstructorUsedError;
  @JsonKey(name: 'releaseDate')
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'isrc')
  String? get isrc => throw _privateConstructorUsedError;
  @JsonKey(name: 'albumName')
  String? get albumName => throw _privateConstructorUsedError;
  @JsonKey(name: 'playParams')
  PlayParams? get playParams => throw _privateConstructorUsedError;
  @JsonKey(name: 'trackNumber')
  int? get trackNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'composerName')
  String? get composerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppleMusicCopyWith<AppleMusic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleMusicCopyWith<$Res> {
  factory $AppleMusicCopyWith(
          AppleMusic value, $Res Function(AppleMusic) then) =
      _$AppleMusicCopyWithImpl<$Res, AppleMusic>;
  @useResult
  $Res call(
      {@JsonKey(name: 'previews') List<Previews>? previews,
      @JsonKey(name: 'artwork') Artwork? artwork,
      @JsonKey(name: 'artistName') String? artistName,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'discNumber') int? discNumber,
      @JsonKey(name: 'genreNames') List<String>? genreNames,
      @JsonKey(name: 'durationInMillis') int? durationInMillis,
      @JsonKey(name: 'releaseDate') String? releaseDate,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'isrc') String? isrc,
      @JsonKey(name: 'albumName') String? albumName,
      @JsonKey(name: 'playParams') PlayParams? playParams,
      @JsonKey(name: 'trackNumber') int? trackNumber,
      @JsonKey(name: 'composerName') String? composerName});

  $ArtworkCopyWith<$Res>? get artwork;
  $PlayParamsCopyWith<$Res>? get playParams;
}

/// @nodoc
class _$AppleMusicCopyWithImpl<$Res, $Val extends AppleMusic>
    implements $AppleMusicCopyWith<$Res> {
  _$AppleMusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previews = freezed,
    Object? artwork = freezed,
    Object? artistName = freezed,
    Object? url = freezed,
    Object? discNumber = freezed,
    Object? genreNames = freezed,
    Object? durationInMillis = freezed,
    Object? releaseDate = freezed,
    Object? name = freezed,
    Object? isrc = freezed,
    Object? albumName = freezed,
    Object? playParams = freezed,
    Object? trackNumber = freezed,
    Object? composerName = freezed,
  }) {
    return _then(_value.copyWith(
      previews: freezed == previews
          ? _value.previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<Previews>?,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork?,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      genreNames: freezed == genreNames
          ? _value.genreNames
          : genreNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      durationInMillis: freezed == durationInMillis
          ? _value.durationInMillis
          : durationInMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isrc: freezed == isrc
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String?,
      albumName: freezed == albumName
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String?,
      playParams: freezed == playParams
          ? _value.playParams
          : playParams // ignore: cast_nullable_to_non_nullable
              as PlayParams?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      composerName: freezed == composerName
          ? _value.composerName
          : composerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtworkCopyWith<$Res>? get artwork {
    if (_value.artwork == null) {
      return null;
    }

    return $ArtworkCopyWith<$Res>(_value.artwork!, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayParamsCopyWith<$Res>? get playParams {
    if (_value.playParams == null) {
      return null;
    }

    return $PlayParamsCopyWith<$Res>(_value.playParams!, (value) {
      return _then(_value.copyWith(playParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppleMusicImplCopyWith<$Res>
    implements $AppleMusicCopyWith<$Res> {
  factory _$$AppleMusicImplCopyWith(
          _$AppleMusicImpl value, $Res Function(_$AppleMusicImpl) then) =
      __$$AppleMusicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'previews') List<Previews>? previews,
      @JsonKey(name: 'artwork') Artwork? artwork,
      @JsonKey(name: 'artistName') String? artistName,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'discNumber') int? discNumber,
      @JsonKey(name: 'genreNames') List<String>? genreNames,
      @JsonKey(name: 'durationInMillis') int? durationInMillis,
      @JsonKey(name: 'releaseDate') String? releaseDate,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'isrc') String? isrc,
      @JsonKey(name: 'albumName') String? albumName,
      @JsonKey(name: 'playParams') PlayParams? playParams,
      @JsonKey(name: 'trackNumber') int? trackNumber,
      @JsonKey(name: 'composerName') String? composerName});

  @override
  $ArtworkCopyWith<$Res>? get artwork;
  @override
  $PlayParamsCopyWith<$Res>? get playParams;
}

/// @nodoc
class __$$AppleMusicImplCopyWithImpl<$Res>
    extends _$AppleMusicCopyWithImpl<$Res, _$AppleMusicImpl>
    implements _$$AppleMusicImplCopyWith<$Res> {
  __$$AppleMusicImplCopyWithImpl(
      _$AppleMusicImpl _value, $Res Function(_$AppleMusicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previews = freezed,
    Object? artwork = freezed,
    Object? artistName = freezed,
    Object? url = freezed,
    Object? discNumber = freezed,
    Object? genreNames = freezed,
    Object? durationInMillis = freezed,
    Object? releaseDate = freezed,
    Object? name = freezed,
    Object? isrc = freezed,
    Object? albumName = freezed,
    Object? playParams = freezed,
    Object? trackNumber = freezed,
    Object? composerName = freezed,
  }) {
    return _then(_$AppleMusicImpl(
      previews: freezed == previews
          ? _value._previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<Previews>?,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork?,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      genreNames: freezed == genreNames
          ? _value._genreNames
          : genreNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      durationInMillis: freezed == durationInMillis
          ? _value.durationInMillis
          : durationInMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isrc: freezed == isrc
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String?,
      albumName: freezed == albumName
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String?,
      playParams: freezed == playParams
          ? _value.playParams
          : playParams // ignore: cast_nullable_to_non_nullable
              as PlayParams?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      composerName: freezed == composerName
          ? _value.composerName
          : composerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleMusicImpl with DiagnosticableTreeMixin implements _AppleMusic {
  const _$AppleMusicImpl(
      {@JsonKey(name: 'previews') final List<Previews>? previews,
      @JsonKey(name: 'artwork') this.artwork,
      @JsonKey(name: 'artistName') this.artistName,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'discNumber') this.discNumber,
      @JsonKey(name: 'genreNames') final List<String>? genreNames,
      @JsonKey(name: 'durationInMillis') this.durationInMillis,
      @JsonKey(name: 'releaseDate') this.releaseDate,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'isrc') this.isrc,
      @JsonKey(name: 'albumName') this.albumName,
      @JsonKey(name: 'playParams') this.playParams,
      @JsonKey(name: 'trackNumber') this.trackNumber,
      @JsonKey(name: 'composerName') this.composerName})
      : _previews = previews,
        _genreNames = genreNames;

  factory _$AppleMusicImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleMusicImplFromJson(json);

  final List<Previews>? _previews;
  @override
  @JsonKey(name: 'previews')
  List<Previews>? get previews {
    final value = _previews;
    if (value == null) return null;
    if (_previews is EqualUnmodifiableListView) return _previews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'artwork')
  final Artwork? artwork;
  @override
  @JsonKey(name: 'artistName')
  final String? artistName;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'discNumber')
  final int? discNumber;
  final List<String>? _genreNames;
  @override
  @JsonKey(name: 'genreNames')
  List<String>? get genreNames {
    final value = _genreNames;
    if (value == null) return null;
    if (_genreNames is EqualUnmodifiableListView) return _genreNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'durationInMillis')
  final int? durationInMillis;
  @override
  @JsonKey(name: 'releaseDate')
  final String? releaseDate;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'isrc')
  final String? isrc;
  @override
  @JsonKey(name: 'albumName')
  final String? albumName;
  @override
  @JsonKey(name: 'playParams')
  final PlayParams? playParams;
  @override
  @JsonKey(name: 'trackNumber')
  final int? trackNumber;
  @override
  @JsonKey(name: 'composerName')
  final String? composerName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppleMusic(previews: $previews, artwork: $artwork, artistName: $artistName, url: $url, discNumber: $discNumber, genreNames: $genreNames, durationInMillis: $durationInMillis, releaseDate: $releaseDate, name: $name, isrc: $isrc, albumName: $albumName, playParams: $playParams, trackNumber: $trackNumber, composerName: $composerName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppleMusic'))
      ..add(DiagnosticsProperty('previews', previews))
      ..add(DiagnosticsProperty('artwork', artwork))
      ..add(DiagnosticsProperty('artistName', artistName))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('discNumber', discNumber))
      ..add(DiagnosticsProperty('genreNames', genreNames))
      ..add(DiagnosticsProperty('durationInMillis', durationInMillis))
      ..add(DiagnosticsProperty('releaseDate', releaseDate))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isrc', isrc))
      ..add(DiagnosticsProperty('albumName', albumName))
      ..add(DiagnosticsProperty('playParams', playParams))
      ..add(DiagnosticsProperty('trackNumber', trackNumber))
      ..add(DiagnosticsProperty('composerName', composerName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleMusicImpl &&
            const DeepCollectionEquality().equals(other._previews, _previews) &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            const DeepCollectionEquality()
                .equals(other._genreNames, _genreNames) &&
            (identical(other.durationInMillis, durationInMillis) ||
                other.durationInMillis == durationInMillis) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isrc, isrc) || other.isrc == isrc) &&
            (identical(other.albumName, albumName) ||
                other.albumName == albumName) &&
            (identical(other.playParams, playParams) ||
                other.playParams == playParams) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.composerName, composerName) ||
                other.composerName == composerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_previews),
      artwork,
      artistName,
      url,
      discNumber,
      const DeepCollectionEquality().hash(_genreNames),
      durationInMillis,
      releaseDate,
      name,
      isrc,
      albumName,
      playParams,
      trackNumber,
      composerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleMusicImplCopyWith<_$AppleMusicImpl> get copyWith =>
      __$$AppleMusicImplCopyWithImpl<_$AppleMusicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleMusicImplToJson(
      this,
    );
  }
}

abstract class _AppleMusic implements AppleMusic {
  const factory _AppleMusic(
          {@JsonKey(name: 'previews') final List<Previews>? previews,
          @JsonKey(name: 'artwork') final Artwork? artwork,
          @JsonKey(name: 'artistName') final String? artistName,
          @JsonKey(name: 'url') final String? url,
          @JsonKey(name: 'discNumber') final int? discNumber,
          @JsonKey(name: 'genreNames') final List<String>? genreNames,
          @JsonKey(name: 'durationInMillis') final int? durationInMillis,
          @JsonKey(name: 'releaseDate') final String? releaseDate,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'isrc') final String? isrc,
          @JsonKey(name: 'albumName') final String? albumName,
          @JsonKey(name: 'playParams') final PlayParams? playParams,
          @JsonKey(name: 'trackNumber') final int? trackNumber,
          @JsonKey(name: 'composerName') final String? composerName}) =
      _$AppleMusicImpl;

  factory _AppleMusic.fromJson(Map<String, dynamic> json) =
      _$AppleMusicImpl.fromJson;

  @override
  @JsonKey(name: 'previews')
  List<Previews>? get previews;
  @override
  @JsonKey(name: 'artwork')
  Artwork? get artwork;
  @override
  @JsonKey(name: 'artistName')
  String? get artistName;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'discNumber')
  int? get discNumber;
  @override
  @JsonKey(name: 'genreNames')
  List<String>? get genreNames;
  @override
  @JsonKey(name: 'durationInMillis')
  int? get durationInMillis;
  @override
  @JsonKey(name: 'releaseDate')
  String? get releaseDate;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'isrc')
  String? get isrc;
  @override
  @JsonKey(name: 'albumName')
  String? get albumName;
  @override
  @JsonKey(name: 'playParams')
  PlayParams? get playParams;
  @override
  @JsonKey(name: 'trackNumber')
  int? get trackNumber;
  @override
  @JsonKey(name: 'composerName')
  String? get composerName;
  @override
  @JsonKey(ignore: true)
  _$$AppleMusicImplCopyWith<_$AppleMusicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Previews _$PreviewsFromJson(Map<String, dynamic> json) {
  return _Previews.fromJson(json);
}

/// @nodoc
mixin _$Previews {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewsCopyWith<Previews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewsCopyWith<$Res> {
  factory $PreviewsCopyWith(Previews value, $Res Function(Previews) then) =
      _$PreviewsCopyWithImpl<$Res, Previews>;
  @useResult
  $Res call({@JsonKey(name: 'url') String? url});
}

/// @nodoc
class _$PreviewsCopyWithImpl<$Res, $Val extends Previews>
    implements $PreviewsCopyWith<$Res> {
  _$PreviewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewsImplCopyWith<$Res>
    implements $PreviewsCopyWith<$Res> {
  factory _$$PreviewsImplCopyWith(
          _$PreviewsImpl value, $Res Function(_$PreviewsImpl) then) =
      __$$PreviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'url') String? url});
}

/// @nodoc
class __$$PreviewsImplCopyWithImpl<$Res>
    extends _$PreviewsCopyWithImpl<$Res, _$PreviewsImpl>
    implements _$$PreviewsImplCopyWith<$Res> {
  __$$PreviewsImplCopyWithImpl(
      _$PreviewsImpl _value, $Res Function(_$PreviewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$PreviewsImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewsImpl with DiagnosticableTreeMixin implements _Previews {
  const _$PreviewsImpl({@JsonKey(name: 'url') this.url});

  factory _$PreviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewsImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Previews(url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Previews'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewsImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewsImplCopyWith<_$PreviewsImpl> get copyWith =>
      __$$PreviewsImplCopyWithImpl<_$PreviewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewsImplToJson(
      this,
    );
  }
}

abstract class _Previews implements Previews {
  const factory _Previews({@JsonKey(name: 'url') final String? url}) =
      _$PreviewsImpl;

  factory _Previews.fromJson(Map<String, dynamic> json) =
      _$PreviewsImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$PreviewsImplCopyWith<_$PreviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artwork _$ArtworkFromJson(Map<String, dynamic> json) {
  return _Artwork.fromJson(json);
}

/// @nodoc
mixin _$Artwork {
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'bgColor')
  String? get bgColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'textColor1')
  String? get textColor1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'textColor2')
  String? get textColor2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'textColor3')
  String? get textColor3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'textColor4')
  String? get textColor4 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res, Artwork>;
  @useResult
  $Res call(
      {@JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'bgColor') String? bgColor,
      @JsonKey(name: 'textColor1') String? textColor1,
      @JsonKey(name: 'textColor2') String? textColor2,
      @JsonKey(name: 'textColor3') String? textColor3,
      @JsonKey(name: 'textColor4') String? textColor4});
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res, $Val extends Artwork>
    implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? bgColor = freezed,
    Object? textColor1 = freezed,
    Object? textColor2 = freezed,
    Object? textColor3 = freezed,
    Object? textColor4 = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: freezed == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor1: freezed == textColor1
          ? _value.textColor1
          : textColor1 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor2: freezed == textColor2
          ? _value.textColor2
          : textColor2 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor3: freezed == textColor3
          ? _value.textColor3
          : textColor3 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor4: freezed == textColor4
          ? _value.textColor4
          : textColor4 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkImplCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$$ArtworkImplCopyWith(
          _$ArtworkImpl value, $Res Function(_$ArtworkImpl) then) =
      __$$ArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'bgColor') String? bgColor,
      @JsonKey(name: 'textColor1') String? textColor1,
      @JsonKey(name: 'textColor2') String? textColor2,
      @JsonKey(name: 'textColor3') String? textColor3,
      @JsonKey(name: 'textColor4') String? textColor4});
}

/// @nodoc
class __$$ArtworkImplCopyWithImpl<$Res>
    extends _$ArtworkCopyWithImpl<$Res, _$ArtworkImpl>
    implements _$$ArtworkImplCopyWith<$Res> {
  __$$ArtworkImplCopyWithImpl(
      _$ArtworkImpl _value, $Res Function(_$ArtworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? bgColor = freezed,
    Object? textColor1 = freezed,
    Object? textColor2 = freezed,
    Object? textColor3 = freezed,
    Object? textColor4 = freezed,
  }) {
    return _then(_$ArtworkImpl(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: freezed == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor1: freezed == textColor1
          ? _value.textColor1
          : textColor1 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor2: freezed == textColor2
          ? _value.textColor2
          : textColor2 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor3: freezed == textColor3
          ? _value.textColor3
          : textColor3 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor4: freezed == textColor4
          ? _value.textColor4
          : textColor4 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkImpl with DiagnosticableTreeMixin implements _Artwork {
  const _$ArtworkImpl(
      {@JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'bgColor') this.bgColor,
      @JsonKey(name: 'textColor1') this.textColor1,
      @JsonKey(name: 'textColor2') this.textColor2,
      @JsonKey(name: 'textColor3') this.textColor3,
      @JsonKey(name: 'textColor4') this.textColor4});

  factory _$ArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkImplFromJson(json);

  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'bgColor')
  final String? bgColor;
  @override
  @JsonKey(name: 'textColor1')
  final String? textColor1;
  @override
  @JsonKey(name: 'textColor2')
  final String? textColor2;
  @override
  @JsonKey(name: 'textColor3')
  final String? textColor3;
  @override
  @JsonKey(name: 'textColor4')
  final String? textColor4;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Artwork(width: $width, height: $height, url: $url, bgColor: $bgColor, textColor1: $textColor1, textColor2: $textColor2, textColor3: $textColor3, textColor4: $textColor4)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Artwork'))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('bgColor', bgColor))
      ..add(DiagnosticsProperty('textColor1', textColor1))
      ..add(DiagnosticsProperty('textColor2', textColor2))
      ..add(DiagnosticsProperty('textColor3', textColor3))
      ..add(DiagnosticsProperty('textColor4', textColor4));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.bgColor, bgColor) || other.bgColor == bgColor) &&
            (identical(other.textColor1, textColor1) ||
                other.textColor1 == textColor1) &&
            (identical(other.textColor2, textColor2) ||
                other.textColor2 == textColor2) &&
            (identical(other.textColor3, textColor3) ||
                other.textColor3 == textColor3) &&
            (identical(other.textColor4, textColor4) ||
                other.textColor4 == textColor4));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, url, bgColor,
      textColor1, textColor2, textColor3, textColor4);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      __$$ArtworkImplCopyWithImpl<_$ArtworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkImplToJson(
      this,
    );
  }
}

abstract class _Artwork implements Artwork {
  const factory _Artwork(
      {@JsonKey(name: 'width') final int? width,
      @JsonKey(name: 'height') final int? height,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'bgColor') final String? bgColor,
      @JsonKey(name: 'textColor1') final String? textColor1,
      @JsonKey(name: 'textColor2') final String? textColor2,
      @JsonKey(name: 'textColor3') final String? textColor3,
      @JsonKey(name: 'textColor4') final String? textColor4}) = _$ArtworkImpl;

  factory _Artwork.fromJson(Map<String, dynamic> json) = _$ArtworkImpl.fromJson;

  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'bgColor')
  String? get bgColor;
  @override
  @JsonKey(name: 'textColor1')
  String? get textColor1;
  @override
  @JsonKey(name: 'textColor2')
  String? get textColor2;
  @override
  @JsonKey(name: 'textColor3')
  String? get textColor3;
  @override
  @JsonKey(name: 'textColor4')
  String? get textColor4;
  @override
  @JsonKey(ignore: true)
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayParams _$PlayParamsFromJson(Map<String, dynamic> json) {
  return _PlayParams.fromJson(json);
}

/// @nodoc
mixin _$PlayParams {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'kind')
  String? get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayParamsCopyWith<PlayParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayParamsCopyWith<$Res> {
  factory $PlayParamsCopyWith(
          PlayParams value, $Res Function(PlayParams) then) =
      _$PlayParamsCopyWithImpl<$Res, PlayParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'kind') String? kind});
}

/// @nodoc
class _$PlayParamsCopyWithImpl<$Res, $Val extends PlayParams>
    implements $PlayParamsCopyWith<$Res> {
  _$PlayParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayParamsImplCopyWith<$Res>
    implements $PlayParamsCopyWith<$Res> {
  factory _$$PlayParamsImplCopyWith(
          _$PlayParamsImpl value, $Res Function(_$PlayParamsImpl) then) =
      __$$PlayParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'kind') String? kind});
}

/// @nodoc
class __$$PlayParamsImplCopyWithImpl<$Res>
    extends _$PlayParamsCopyWithImpl<$Res, _$PlayParamsImpl>
    implements _$$PlayParamsImplCopyWith<$Res> {
  __$$PlayParamsImplCopyWithImpl(
      _$PlayParamsImpl _value, $Res Function(_$PlayParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
  }) {
    return _then(_$PlayParamsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayParamsImpl with DiagnosticableTreeMixin implements _PlayParams {
  const _$PlayParamsImpl(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'kind') this.kind});

  factory _$PlayParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayParamsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'kind')
  final String? kind;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayParams(id: $id, kind: $kind)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayParams'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('kind', kind));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayParamsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, kind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayParamsImplCopyWith<_$PlayParamsImpl> get copyWith =>
      __$$PlayParamsImplCopyWithImpl<_$PlayParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayParamsImplToJson(
      this,
    );
  }
}

abstract class _PlayParams implements PlayParams {
  const factory _PlayParams(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'kind') final String? kind}) = _$PlayParamsImpl;

  factory _PlayParams.fromJson(Map<String, dynamic> json) =
      _$PlayParamsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'kind')
  String? get kind;
  @override
  @JsonKey(ignore: true)
  _$$PlayParamsImplCopyWith<_$PlayParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return _Artists.fromJson(json);
}

/// @nodoc
mixin _$Artists {
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'href')
  String? get href => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'uri')
  String? get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistsCopyWith<Artists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistsCopyWith<$Res> {
  factory $ArtistsCopyWith(Artists value, $Res Function(Artists) then) =
      _$ArtistsCopyWithImpl<$Res, Artists>;
  @useResult
  $Res call(
      {@JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$ArtistsCopyWithImpl<$Res, $Val extends Artists>
    implements $ArtistsCopyWith<$Res> {
  _$ArtistsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtistsImplCopyWith<$Res> implements $ArtistsCopyWith<$Res> {
  factory _$$ArtistsImplCopyWith(
          _$ArtistsImpl value, $Res Function(_$ArtistsImpl) then) =
      __$$ArtistsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$ArtistsImplCopyWithImpl<$Res>
    extends _$ArtistsCopyWithImpl<$Res, _$ArtistsImpl>
    implements _$$ArtistsImplCopyWith<$Res> {
  __$$ArtistsImplCopyWithImpl(
      _$ArtistsImpl _value, $Res Function(_$ArtistsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$ArtistsImpl(
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistsImpl with DiagnosticableTreeMixin implements _Artists {
  const _$ArtistsImpl(
      {@JsonKey(name: 'external_urls') this.externalUrls,
      @JsonKey(name: 'href') this.href,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'uri') this.uri});

  factory _$ArtistsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistsImplFromJson(json);

  @override
  @JsonKey(name: 'external_urls')
  final ExternalUrls? externalUrls;
  @override
  @JsonKey(name: 'href')
  final String? href;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'uri')
  final String? uri;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Artists(externalUrls: $externalUrls, href: $href, id: $id, name: $name, type: $type, uri: $uri)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Artists'))
      ..add(DiagnosticsProperty('externalUrls', externalUrls))
      ..add(DiagnosticsProperty('href', href))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('uri', uri));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistsImpl &&
            (identical(other.externalUrls, externalUrls) ||
                other.externalUrls == externalUrls) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, externalUrls, href, id, name, type, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistsImplCopyWith<_$ArtistsImpl> get copyWith =>
      __$$ArtistsImplCopyWithImpl<_$ArtistsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistsImplToJson(
      this,
    );
  }
}

abstract class _Artists implements Artists {
  const factory _Artists(
      {@JsonKey(name: 'external_urls') final ExternalUrls? externalUrls,
      @JsonKey(name: 'href') final String? href,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'uri') final String? uri}) = _$ArtistsImpl;

  factory _Artists.fromJson(Map<String, dynamic> json) = _$ArtistsImpl.fromJson;

  @override
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls;
  @override
  @JsonKey(name: 'href')
  String? get href;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'uri')
  String? get uri;
  @override
  @JsonKey(ignore: true)
  _$$ArtistsImplCopyWith<_$ArtistsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Spotify _$SpotifyFromJson(Map<String, dynamic> json) {
  return _Spotify.fromJson(json);
}

/// @nodoc
mixin _$Spotify {
  @JsonKey(name: 'album')
  Album? get album => throw _privateConstructorUsedError;
  @JsonKey(name: 'artists')
  List<Artists>? get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'disc_number')
  int? get discNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_ms')
  int? get durationMs => throw _privateConstructorUsedError;
  @JsonKey(name: 'explicit')
  bool? get explicit => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_ids')
  ExternalIds? get externalIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'href')
  String? get href => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_local')
  bool? get isLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  int? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_number')
  int? get trackNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'uri')
  String? get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotifyCopyWith<Spotify> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotifyCopyWith<$Res> {
  factory $SpotifyCopyWith(Spotify value, $Res Function(Spotify) then) =
      _$SpotifyCopyWithImpl<$Res, Spotify>;
  @useResult
  $Res call(
      {@JsonKey(name: 'album') Album? album,
      @JsonKey(name: 'artists') List<Artists>? artists,
      @JsonKey(name: 'disc_number') int? discNumber,
      @JsonKey(name: 'duration_ms') int? durationMs,
      @JsonKey(name: 'explicit') bool? explicit,
      @JsonKey(name: 'external_ids') ExternalIds? externalIds,
      @JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'is_local') bool? isLocal,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'popularity') int? popularity,
      @JsonKey(name: 'track_number') int? trackNumber,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  $AlbumCopyWith<$Res>? get album;
  $ExternalIdsCopyWith<$Res>? get externalIds;
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$SpotifyCopyWithImpl<$Res, $Val extends Spotify>
    implements $SpotifyCopyWith<$Res> {
  _$SpotifyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album = freezed,
    Object? artists = freezed,
    Object? discNumber = freezed,
    Object? durationMs = freezed,
    Object? explicit = freezed,
    Object? externalIds = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? isLocal = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? trackNumber = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artists>?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMs: freezed == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalIds: freezed == externalIds
          ? _value.externalIds
          : externalIds // ignore: cast_nullable_to_non_nullable
              as ExternalIds?,
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumCopyWith<$Res>? get album {
    if (_value.album == null) {
      return null;
    }

    return $AlbumCopyWith<$Res>(_value.album!, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExternalIdsCopyWith<$Res>? get externalIds {
    if (_value.externalIds == null) {
      return null;
    }

    return $ExternalIdsCopyWith<$Res>(_value.externalIds!, (value) {
      return _then(_value.copyWith(externalIds: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpotifyImplCopyWith<$Res> implements $SpotifyCopyWith<$Res> {
  factory _$$SpotifyImplCopyWith(
          _$SpotifyImpl value, $Res Function(_$SpotifyImpl) then) =
      __$$SpotifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'album') Album? album,
      @JsonKey(name: 'artists') List<Artists>? artists,
      @JsonKey(name: 'disc_number') int? discNumber,
      @JsonKey(name: 'duration_ms') int? durationMs,
      @JsonKey(name: 'explicit') bool? explicit,
      @JsonKey(name: 'external_ids') ExternalIds? externalIds,
      @JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'is_local') bool? isLocal,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'popularity') int? popularity,
      @JsonKey(name: 'track_number') int? trackNumber,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  @override
  $AlbumCopyWith<$Res>? get album;
  @override
  $ExternalIdsCopyWith<$Res>? get externalIds;
  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$SpotifyImplCopyWithImpl<$Res>
    extends _$SpotifyCopyWithImpl<$Res, _$SpotifyImpl>
    implements _$$SpotifyImplCopyWith<$Res> {
  __$$SpotifyImplCopyWithImpl(
      _$SpotifyImpl _value, $Res Function(_$SpotifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album = freezed,
    Object? artists = freezed,
    Object? discNumber = freezed,
    Object? durationMs = freezed,
    Object? explicit = freezed,
    Object? externalIds = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? isLocal = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? trackNumber = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$SpotifyImpl(
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as Album?,
      artists: freezed == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artists>?,
      discNumber: freezed == discNumber
          ? _value.discNumber
          : discNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMs: freezed == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      explicit: freezed == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalIds: freezed == externalIds
          ? _value.externalIds
          : externalIds // ignore: cast_nullable_to_non_nullable
              as ExternalIds?,
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: freezed == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotifyImpl with DiagnosticableTreeMixin implements _Spotify {
  const _$SpotifyImpl(
      {@JsonKey(name: 'album') this.album,
      @JsonKey(name: 'artists') final List<Artists>? artists,
      @JsonKey(name: 'disc_number') this.discNumber,
      @JsonKey(name: 'duration_ms') this.durationMs,
      @JsonKey(name: 'explicit') this.explicit,
      @JsonKey(name: 'external_ids') this.externalIds,
      @JsonKey(name: 'external_urls') this.externalUrls,
      @JsonKey(name: 'href') this.href,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'is_local') this.isLocal,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'popularity') this.popularity,
      @JsonKey(name: 'track_number') this.trackNumber,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'uri') this.uri})
      : _artists = artists;

  factory _$SpotifyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotifyImplFromJson(json);

  @override
  @JsonKey(name: 'album')
  final Album? album;
  final List<Artists>? _artists;
  @override
  @JsonKey(name: 'artists')
  List<Artists>? get artists {
    final value = _artists;
    if (value == null) return null;
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'disc_number')
  final int? discNumber;
  @override
  @JsonKey(name: 'duration_ms')
  final int? durationMs;
  @override
  @JsonKey(name: 'explicit')
  final bool? explicit;
  @override
  @JsonKey(name: 'external_ids')
  final ExternalIds? externalIds;
  @override
  @JsonKey(name: 'external_urls')
  final ExternalUrls? externalUrls;
  @override
  @JsonKey(name: 'href')
  final String? href;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'is_local')
  final bool? isLocal;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'popularity')
  final int? popularity;
  @override
  @JsonKey(name: 'track_number')
  final int? trackNumber;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'uri')
  final String? uri;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Spotify(album: $album, artists: $artists, discNumber: $discNumber, durationMs: $durationMs, explicit: $explicit, externalIds: $externalIds, externalUrls: $externalUrls, href: $href, id: $id, isLocal: $isLocal, name: $name, popularity: $popularity, trackNumber: $trackNumber, type: $type, uri: $uri)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Spotify'))
      ..add(DiagnosticsProperty('album', album))
      ..add(DiagnosticsProperty('artists', artists))
      ..add(DiagnosticsProperty('discNumber', discNumber))
      ..add(DiagnosticsProperty('durationMs', durationMs))
      ..add(DiagnosticsProperty('explicit', explicit))
      ..add(DiagnosticsProperty('externalIds', externalIds))
      ..add(DiagnosticsProperty('externalUrls', externalUrls))
      ..add(DiagnosticsProperty('href', href))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isLocal', isLocal))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('popularity', popularity))
      ..add(DiagnosticsProperty('trackNumber', trackNumber))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('uri', uri));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotifyImpl &&
            (identical(other.album, album) || other.album == album) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.discNumber, discNumber) ||
                other.discNumber == discNumber) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit) &&
            (identical(other.externalIds, externalIds) ||
                other.externalIds == externalIds) &&
            (identical(other.externalUrls, externalUrls) ||
                other.externalUrls == externalUrls) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      album,
      const DeepCollectionEquality().hash(_artists),
      discNumber,
      durationMs,
      explicit,
      externalIds,
      externalUrls,
      href,
      id,
      isLocal,
      name,
      popularity,
      trackNumber,
      type,
      uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotifyImplCopyWith<_$SpotifyImpl> get copyWith =>
      __$$SpotifyImplCopyWithImpl<_$SpotifyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotifyImplToJson(
      this,
    );
  }
}

abstract class _Spotify implements Spotify {
  const factory _Spotify(
      {@JsonKey(name: 'album') final Album? album,
      @JsonKey(name: 'artists') final List<Artists>? artists,
      @JsonKey(name: 'disc_number') final int? discNumber,
      @JsonKey(name: 'duration_ms') final int? durationMs,
      @JsonKey(name: 'explicit') final bool? explicit,
      @JsonKey(name: 'external_ids') final ExternalIds? externalIds,
      @JsonKey(name: 'external_urls') final ExternalUrls? externalUrls,
      @JsonKey(name: 'href') final String? href,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'is_local') final bool? isLocal,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'popularity') final int? popularity,
      @JsonKey(name: 'track_number') final int? trackNumber,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'uri') final String? uri}) = _$SpotifyImpl;

  factory _Spotify.fromJson(Map<String, dynamic> json) = _$SpotifyImpl.fromJson;

  @override
  @JsonKey(name: 'album')
  Album? get album;
  @override
  @JsonKey(name: 'artists')
  List<Artists>? get artists;
  @override
  @JsonKey(name: 'disc_number')
  int? get discNumber;
  @override
  @JsonKey(name: 'duration_ms')
  int? get durationMs;
  @override
  @JsonKey(name: 'explicit')
  bool? get explicit;
  @override
  @JsonKey(name: 'external_ids')
  ExternalIds? get externalIds;
  @override
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls;
  @override
  @JsonKey(name: 'href')
  String? get href;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'is_local')
  bool? get isLocal;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'popularity')
  int? get popularity;
  @override
  @JsonKey(name: 'track_number')
  int? get trackNumber;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'uri')
  String? get uri;
  @override
  @JsonKey(ignore: true)
  _$$SpotifyImplCopyWith<_$SpotifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  @JsonKey(name: 'album_type')
  String? get albumType => throw _privateConstructorUsedError;
  @JsonKey(name: 'artists')
  List<Artists>? get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'href')
  String? get href => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<Images>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date_precision')
  String? get releaseDatePrecision => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tracks')
  int? get totalTracks => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'uri')
  String? get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call(
      {@JsonKey(name: 'album_type') String? albumType,
      @JsonKey(name: 'artists') List<Artists>? artists,
      @JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'images') List<Images>? images,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'release_date_precision') String? releaseDatePrecision,
      @JsonKey(name: 'total_tracks') int? totalTracks,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumType = freezed,
    Object? artists = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? releaseDate = freezed,
    Object? releaseDatePrecision = freezed,
    Object? totalTracks = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      albumType: freezed == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String?,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artists>?,
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDatePrecision: freezed == releaseDatePrecision
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTracks: freezed == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExternalUrlsCopyWith<$Res>? get externalUrls {
    if (_value.externalUrls == null) {
      return null;
    }

    return $ExternalUrlsCopyWith<$Res>(_value.externalUrls!, (value) {
      return _then(_value.copyWith(externalUrls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlbumImplCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$AlbumImplCopyWith(
          _$AlbumImpl value, $Res Function(_$AlbumImpl) then) =
      __$$AlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'album_type') String? albumType,
      @JsonKey(name: 'artists') List<Artists>? artists,
      @JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
      @JsonKey(name: 'href') String? href,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'images') List<Images>? images,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'release_date_precision') String? releaseDatePrecision,
      @JsonKey(name: 'total_tracks') int? totalTracks,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'uri') String? uri});

  @override
  $ExternalUrlsCopyWith<$Res>? get externalUrls;
}

/// @nodoc
class __$$AlbumImplCopyWithImpl<$Res>
    extends _$AlbumCopyWithImpl<$Res, _$AlbumImpl>
    implements _$$AlbumImplCopyWith<$Res> {
  __$$AlbumImplCopyWithImpl(
      _$AlbumImpl _value, $Res Function(_$AlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumType = freezed,
    Object? artists = freezed,
    Object? externalUrls = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? releaseDate = freezed,
    Object? releaseDatePrecision = freezed,
    Object? totalTracks = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_$AlbumImpl(
      albumType: freezed == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as String?,
      artists: freezed == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artists>?,
      externalUrls: freezed == externalUrls
          ? _value.externalUrls
          : externalUrls // ignore: cast_nullable_to_non_nullable
              as ExternalUrls?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDatePrecision: freezed == releaseDatePrecision
          ? _value.releaseDatePrecision
          : releaseDatePrecision // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTracks: freezed == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumImpl with DiagnosticableTreeMixin implements _Album {
  const _$AlbumImpl(
      {@JsonKey(name: 'album_type') this.albumType,
      @JsonKey(name: 'artists') final List<Artists>? artists,
      @JsonKey(name: 'external_urls') this.externalUrls,
      @JsonKey(name: 'href') this.href,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'images') final List<Images>? images,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'release_date') this.releaseDate,
      @JsonKey(name: 'release_date_precision') this.releaseDatePrecision,
      @JsonKey(name: 'total_tracks') this.totalTracks,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'uri') this.uri})
      : _artists = artists,
        _images = images;

  factory _$AlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumImplFromJson(json);

  @override
  @JsonKey(name: 'album_type')
  final String? albumType;
  final List<Artists>? _artists;
  @override
  @JsonKey(name: 'artists')
  List<Artists>? get artists {
    final value = _artists;
    if (value == null) return null;
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'external_urls')
  final ExternalUrls? externalUrls;
  @override
  @JsonKey(name: 'href')
  final String? href;
  @override
  @JsonKey(name: 'id')
  final String? id;
  final List<Images>? _images;
  @override
  @JsonKey(name: 'images')
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  @JsonKey(name: 'release_date_precision')
  final String? releaseDatePrecision;
  @override
  @JsonKey(name: 'total_tracks')
  final int? totalTracks;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'uri')
  final String? uri;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Album(albumType: $albumType, artists: $artists, externalUrls: $externalUrls, href: $href, id: $id, images: $images, name: $name, releaseDate: $releaseDate, releaseDatePrecision: $releaseDatePrecision, totalTracks: $totalTracks, type: $type, uri: $uri)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Album'))
      ..add(DiagnosticsProperty('albumType', albumType))
      ..add(DiagnosticsProperty('artists', artists))
      ..add(DiagnosticsProperty('externalUrls', externalUrls))
      ..add(DiagnosticsProperty('href', href))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('releaseDate', releaseDate))
      ..add(DiagnosticsProperty('releaseDatePrecision', releaseDatePrecision))
      ..add(DiagnosticsProperty('totalTracks', totalTracks))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('uri', uri));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumImpl &&
            (identical(other.albumType, albumType) ||
                other.albumType == albumType) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.externalUrls, externalUrls) ||
                other.externalUrls == externalUrls) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.releaseDatePrecision, releaseDatePrecision) ||
                other.releaseDatePrecision == releaseDatePrecision) &&
            (identical(other.totalTracks, totalTracks) ||
                other.totalTracks == totalTracks) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      albumType,
      const DeepCollectionEquality().hash(_artists),
      externalUrls,
      href,
      id,
      const DeepCollectionEquality().hash(_images),
      name,
      releaseDate,
      releaseDatePrecision,
      totalTracks,
      type,
      uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      __$$AlbumImplCopyWithImpl<_$AlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumImplToJson(
      this,
    );
  }
}

abstract class _Album implements Album {
  const factory _Album(
      {@JsonKey(name: 'album_type') final String? albumType,
      @JsonKey(name: 'artists') final List<Artists>? artists,
      @JsonKey(name: 'external_urls') final ExternalUrls? externalUrls,
      @JsonKey(name: 'href') final String? href,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'images') final List<Images>? images,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'release_date') final String? releaseDate,
      @JsonKey(name: 'release_date_precision')
      final String? releaseDatePrecision,
      @JsonKey(name: 'total_tracks') final int? totalTracks,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'uri') final String? uri}) = _$AlbumImpl;

  factory _Album.fromJson(Map<String, dynamic> json) = _$AlbumImpl.fromJson;

  @override
  @JsonKey(name: 'album_type')
  String? get albumType;
  @override
  @JsonKey(name: 'artists')
  List<Artists>? get artists;
  @override
  @JsonKey(name: 'external_urls')
  ExternalUrls? get externalUrls;
  @override
  @JsonKey(name: 'href')
  String? get href;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'images')
  List<Images>? get images;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  @JsonKey(name: 'release_date_precision')
  String? get releaseDatePrecision;
  @override
  @JsonKey(name: 'total_tracks')
  int? get totalTracks;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'uri')
  String? get uri;
  @override
  @JsonKey(ignore: true)
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) {
  return _ExternalUrls.fromJson(json);
}

/// @nodoc
mixin _$ExternalUrls {
  @JsonKey(name: 'spotify')
  String? get spotify => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalUrlsCopyWith<ExternalUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalUrlsCopyWith<$Res> {
  factory $ExternalUrlsCopyWith(
          ExternalUrls value, $Res Function(ExternalUrls) then) =
      _$ExternalUrlsCopyWithImpl<$Res, ExternalUrls>;
  @useResult
  $Res call({@JsonKey(name: 'spotify') String? spotify});
}

/// @nodoc
class _$ExternalUrlsCopyWithImpl<$Res, $Val extends ExternalUrls>
    implements $ExternalUrlsCopyWith<$Res> {
  _$ExternalUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotify = freezed,
  }) {
    return _then(_value.copyWith(
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalUrlsImplCopyWith<$Res>
    implements $ExternalUrlsCopyWith<$Res> {
  factory _$$ExternalUrlsImplCopyWith(
          _$ExternalUrlsImpl value, $Res Function(_$ExternalUrlsImpl) then) =
      __$$ExternalUrlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'spotify') String? spotify});
}

/// @nodoc
class __$$ExternalUrlsImplCopyWithImpl<$Res>
    extends _$ExternalUrlsCopyWithImpl<$Res, _$ExternalUrlsImpl>
    implements _$$ExternalUrlsImplCopyWith<$Res> {
  __$$ExternalUrlsImplCopyWithImpl(
      _$ExternalUrlsImpl _value, $Res Function(_$ExternalUrlsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotify = freezed,
  }) {
    return _then(_$ExternalUrlsImpl(
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalUrlsImpl with DiagnosticableTreeMixin implements _ExternalUrls {
  const _$ExternalUrlsImpl({@JsonKey(name: 'spotify') this.spotify});

  factory _$ExternalUrlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExternalUrlsImplFromJson(json);

  @override
  @JsonKey(name: 'spotify')
  final String? spotify;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExternalUrls(spotify: $spotify)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExternalUrls'))
      ..add(DiagnosticsProperty('spotify', spotify));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalUrlsImpl &&
            (identical(other.spotify, spotify) || other.spotify == spotify));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, spotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalUrlsImplCopyWith<_$ExternalUrlsImpl> get copyWith =>
      __$$ExternalUrlsImplCopyWithImpl<_$ExternalUrlsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalUrlsImplToJson(
      this,
    );
  }
}

abstract class _ExternalUrls implements ExternalUrls {
  const factory _ExternalUrls(
      {@JsonKey(name: 'spotify') final String? spotify}) = _$ExternalUrlsImpl;

  factory _ExternalUrls.fromJson(Map<String, dynamic> json) =
      _$ExternalUrlsImpl.fromJson;

  @override
  @JsonKey(name: 'spotify')
  String? get spotify;
  @override
  @JsonKey(ignore: true)
  _$$ExternalUrlsImplCopyWith<_$ExternalUrlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) {
  return _ExternalIds.fromJson(json);
}

/// @nodoc
mixin _$ExternalIds {
  @JsonKey(name: 'isrc')
  String? get isrc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExternalIdsCopyWith<ExternalIds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalIdsCopyWith<$Res> {
  factory $ExternalIdsCopyWith(
          ExternalIds value, $Res Function(ExternalIds) then) =
      _$ExternalIdsCopyWithImpl<$Res, ExternalIds>;
  @useResult
  $Res call({@JsonKey(name: 'isrc') String? isrc});
}

/// @nodoc
class _$ExternalIdsCopyWithImpl<$Res, $Val extends ExternalIds>
    implements $ExternalIdsCopyWith<$Res> {
  _$ExternalIdsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isrc = freezed,
  }) {
    return _then(_value.copyWith(
      isrc: freezed == isrc
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExternalIdsImplCopyWith<$Res>
    implements $ExternalIdsCopyWith<$Res> {
  factory _$$ExternalIdsImplCopyWith(
          _$ExternalIdsImpl value, $Res Function(_$ExternalIdsImpl) then) =
      __$$ExternalIdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'isrc') String? isrc});
}

/// @nodoc
class __$$ExternalIdsImplCopyWithImpl<$Res>
    extends _$ExternalIdsCopyWithImpl<$Res, _$ExternalIdsImpl>
    implements _$$ExternalIdsImplCopyWith<$Res> {
  __$$ExternalIdsImplCopyWithImpl(
      _$ExternalIdsImpl _value, $Res Function(_$ExternalIdsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isrc = freezed,
  }) {
    return _then(_$ExternalIdsImpl(
      isrc: freezed == isrc
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExternalIdsImpl with DiagnosticableTreeMixin implements _ExternalIds {
  const _$ExternalIdsImpl({@JsonKey(name: 'isrc') this.isrc});

  factory _$ExternalIdsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExternalIdsImplFromJson(json);

  @override
  @JsonKey(name: 'isrc')
  final String? isrc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExternalIds(isrc: $isrc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExternalIds'))
      ..add(DiagnosticsProperty('isrc', isrc));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExternalIdsImpl &&
            (identical(other.isrc, isrc) || other.isrc == isrc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isrc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExternalIdsImplCopyWith<_$ExternalIdsImpl> get copyWith =>
      __$$ExternalIdsImplCopyWithImpl<_$ExternalIdsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExternalIdsImplToJson(
      this,
    );
  }
}

abstract class _ExternalIds implements ExternalIds {
  const factory _ExternalIds({@JsonKey(name: 'isrc') final String? isrc}) =
      _$ExternalIdsImpl;

  factory _ExternalIds.fromJson(Map<String, dynamic> json) =
      _$ExternalIdsImpl.fromJson;

  @override
  @JsonKey(name: 'isrc')
  String? get isrc;
  @override
  @JsonKey(ignore: true)
  _$$ExternalIdsImplCopyWith<_$ExternalIdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call(
      {@JsonKey(name: 'height') int? height,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width});
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesImplCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$ImagesImplCopyWith(
          _$ImagesImpl value, $Res Function(_$ImagesImpl) then) =
      __$$ImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'height') int? height,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width});
}

/// @nodoc
class __$$ImagesImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesImpl>
    implements _$$ImagesImplCopyWith<$Res> {
  __$$ImagesImplCopyWithImpl(
      _$ImagesImpl _value, $Res Function(_$ImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_$ImagesImpl(
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesImpl with DiagnosticableTreeMixin implements _Images {
  const _$ImagesImpl(
      {@JsonKey(name: 'height') this.height,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'width') this.width});

  factory _$ImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesImplFromJson(json);

  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'width')
  final int? width;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Images(height: $height, url: $url, width: $width)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Images'))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('width', width));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, height, url, width);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      __$$ImagesImplCopyWithImpl<_$ImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesImplToJson(
      this,
    );
  }
}

abstract class _Images implements Images {
  const factory _Images(
      {@JsonKey(name: 'height') final int? height,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'width') final int? width}) = _$ImagesImpl;

  factory _Images.fromJson(Map<String, dynamic> json) = _$ImagesImpl.fromJson;

  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(ignore: true)
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
