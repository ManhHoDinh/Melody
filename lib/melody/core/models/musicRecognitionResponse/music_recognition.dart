import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'music_recognition.freezed.dart';
part 'music_recognition.g.dart';

@freezed
class MusicRecognitionResponse with _$MusicRecognitionResponse {
  const factory MusicRecognitionResponse({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'result') Result? result,
  }) = _MusicRecognitionResponse;

  factory MusicRecognitionResponse.fromJson(Map<String, Object?> json) =>
      _$MusicRecognitionResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: 'artist') String? artist,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'album') String? album,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'timecode') String? timecode,
    @JsonKey(name: 'song_link') String? songLink,
    @JsonKey(name: 'apple_music') AppleMusic? appleMusic,
    @JsonKey(name: 'spotify') Spotify? spotify,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}

@freezed
class AppleMusic with _$AppleMusic {
  const factory AppleMusic({
    @JsonKey(name: 'previews') List<Previews>? previews,
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
    @JsonKey(name: 'composerName') String? composerName,
  }) = _AppleMusic;

  factory AppleMusic.fromJson(Map<String, Object?> json) =>
      _$AppleMusicFromJson(json);
}

@freezed
class Previews with _$Previews {
  const factory Previews({
    @JsonKey(name: 'url') String? url,
  }) = _Previews;

  factory Previews.fromJson(Map<String, Object?> json) =>
      _$PreviewsFromJson(json);
}

@freezed
class Artwork with _$Artwork {
  const factory Artwork({
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'bgColor') String? bgColor,
    @JsonKey(name: 'textColor1') String? textColor1,
    @JsonKey(name: 'textColor2') String? textColor2,
    @JsonKey(name: 'textColor3') String? textColor3,
    @JsonKey(name: 'textColor4') String? textColor4,
  }) = _Artwork;

  factory Artwork.fromJson(Map<String, Object?> json) =>
      _$ArtworkFromJson(json);
}

@freezed
class PlayParams with _$PlayParams {
  const factory PlayParams({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'kind') String? kind,
  }) = _PlayParams;

  factory PlayParams.fromJson(Map<String, Object?> json) =>
      _$PlayParamsFromJson(json);
}
@freezed
class Artists with _$Artists {
  const factory Artists({
    @JsonKey(name: 'external_urls') ExternalUrls? externalUrls,
    @JsonKey(name: 'href') String? href,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'uri') String? uri,
  }) = _Artists;

  factory Artists.fromJson(Map<String, Object?> json) =>
      _$ArtistsFromJson(json);
}

@freezed
class Spotify with _$Spotify {
  const factory Spotify({
    @JsonKey(name: 'album') Album? album,
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
    @JsonKey(name: 'uri') String? uri,
  }) = _Spotify;

  factory Spotify.fromJson(Map<String, Object?> json) =>
      _$SpotifyFromJson(json);
}

@freezed
class Album with _$Album {
  const factory Album({
    @JsonKey(name: 'album_type') String? albumType,
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
    @JsonKey(name: 'uri') String? uri,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
}


@freezed
class ExternalUrls with _$ExternalUrls {
  const factory ExternalUrls({
    @JsonKey(name: 'spotify') String? spotify,
  }) = _ExternalUrls;

  factory ExternalUrls.fromJson(Map<String, Object?> json) =>
      _$ExternalUrlsFromJson(json);
}

@freezed
class ExternalIds with _$ExternalIds {
  const factory ExternalIds({
    @JsonKey(name: 'isrc') String? isrc,
  }) = _ExternalIds;

  factory ExternalIds.fromJson(Map<String, Object?> json) =>
      _$ExternalIdsFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'width') int? width,
  }) = _Images;

  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}


