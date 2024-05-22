// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_recognition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicRecognitionResponseImpl _$$MusicRecognitionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicRecognitionResponseImpl(
      status: json['status'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MusicRecognitionResponseImplToJson(
        _$MusicRecognitionResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      artist: json['artist'] as String?,
      title: json['title'] as String?,
      album: json['album'] as String?,
      releaseDate: json['release_date'] as String?,
      label: json['label'] as String?,
      timecode: json['timecode'] as String?,
      songLink: json['song_link'] as String?,
      appleMusic: json['apple_music'] == null
          ? null
          : AppleMusic.fromJson(json['apple_music'] as Map<String, dynamic>),
      spotify: json['spotify'] == null
          ? null
          : Spotify.fromJson(json['spotify'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'title': instance.title,
      'album': instance.album,
      'release_date': instance.releaseDate,
      'label': instance.label,
      'timecode': instance.timecode,
      'song_link': instance.songLink,
      'apple_music': instance.appleMusic,
      'spotify': instance.spotify,
    };

_$AppleMusicImpl _$$AppleMusicImplFromJson(Map<String, dynamic> json) =>
    _$AppleMusicImpl(
      previews: (json['previews'] as List<dynamic>?)
          ?.map((e) => Previews.fromJson(e as Map<String, dynamic>))
          .toList(),
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      artistName: json['artistName'] as String?,
      url: json['url'] as String?,
      discNumber: (json['discNumber'] as num?)?.toInt(),
      genreNames: (json['genreNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      durationInMillis: (json['durationInMillis'] as num?)?.toInt(),
      releaseDate: json['releaseDate'] as String?,
      name: json['name'] as String?,
      isrc: json['isrc'] as String?,
      albumName: json['albumName'] as String?,
      playParams: json['playParams'] == null
          ? null
          : PlayParams.fromJson(json['playParams'] as Map<String, dynamic>),
      trackNumber: (json['trackNumber'] as num?)?.toInt(),
      composerName: json['composerName'] as String?,
    );

Map<String, dynamic> _$$AppleMusicImplToJson(_$AppleMusicImpl instance) =>
    <String, dynamic>{
      'previews': instance.previews,
      'artwork': instance.artwork,
      'artistName': instance.artistName,
      'url': instance.url,
      'discNumber': instance.discNumber,
      'genreNames': instance.genreNames,
      'durationInMillis': instance.durationInMillis,
      'releaseDate': instance.releaseDate,
      'name': instance.name,
      'isrc': instance.isrc,
      'albumName': instance.albumName,
      'playParams': instance.playParams,
      'trackNumber': instance.trackNumber,
      'composerName': instance.composerName,
    };

_$PreviewsImpl _$$PreviewsImplFromJson(Map<String, dynamic> json) =>
    _$PreviewsImpl(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$PreviewsImplToJson(_$PreviewsImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$ArtworkImpl _$$ArtworkImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkImpl(
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
      bgColor: json['bgColor'] as String?,
      textColor1: json['textColor1'] as String?,
      textColor2: json['textColor2'] as String?,
      textColor3: json['textColor3'] as String?,
      textColor4: json['textColor4'] as String?,
    );

Map<String, dynamic> _$$ArtworkImplToJson(_$ArtworkImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'bgColor': instance.bgColor,
      'textColor1': instance.textColor1,
      'textColor2': instance.textColor2,
      'textColor3': instance.textColor3,
      'textColor4': instance.textColor4,
    };

_$PlayParamsImpl _$$PlayParamsImplFromJson(Map<String, dynamic> json) =>
    _$PlayParamsImpl(
      id: json['id'] as String?,
      kind: json['kind'] as String?,
    );

Map<String, dynamic> _$$PlayParamsImplToJson(_$PlayParamsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
    };

_$ArtistsImpl _$$ArtistsImplFromJson(Map<String, dynamic> json) =>
    _$ArtistsImpl(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$$ArtistsImplToJson(_$ArtistsImpl instance) =>
    <String, dynamic>{
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

_$SpotifyImpl _$$SpotifyImplFromJson(Map<String, dynamic> json) =>
    _$SpotifyImpl(
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: (json['disc_number'] as num?)?.toInt(),
      durationMs: (json['duration_ms'] as num?)?.toInt(),
      explicit: json['explicit'] as bool?,
      externalIds: json['external_ids'] == null
          ? null
          : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String?,
      id: json['id'] as String?,
      isLocal: json['is_local'] as bool?,
      name: json['name'] as String?,
      popularity: (json['popularity'] as num?)?.toInt(),
      trackNumber: (json['track_number'] as num?)?.toInt(),
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$$SpotifyImplToJson(_$SpotifyImpl instance) =>
    <String, dynamic>{
      'album': instance.album,
      'artists': instance.artists,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'explicit': instance.explicit,
      'external_ids': instance.externalIds,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'is_local': instance.isLocal,
      'name': instance.name,
      'popularity': instance.popularity,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
    };

_$AlbumImpl _$$AlbumImplFromJson(Map<String, dynamic> json) => _$AlbumImpl(
      albumType: json['album_type'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      releaseDate: json['release_date'] as String?,
      releaseDatePrecision: json['release_date_precision'] as String?,
      totalTracks: (json['total_tracks'] as num?)?.toInt(),
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$$AlbumImplToJson(_$AlbumImpl instance) =>
    <String, dynamic>{
      'album_type': instance.albumType,
      'artists': instance.artists,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'release_date': instance.releaseDate,
      'release_date_precision': instance.releaseDatePrecision,
      'total_tracks': instance.totalTracks,
      'type': instance.type,
      'uri': instance.uri,
    };

_$ExternalUrlsImpl _$$ExternalUrlsImplFromJson(Map<String, dynamic> json) =>
    _$ExternalUrlsImpl(
      spotify: json['spotify'] as String?,
    );

Map<String, dynamic> _$$ExternalUrlsImplToJson(_$ExternalUrlsImpl instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
    };

_$ExternalIdsImpl _$$ExternalIdsImplFromJson(Map<String, dynamic> json) =>
    _$ExternalIdsImpl(
      isrc: json['isrc'] as String?,
    );

Map<String, dynamic> _$$ExternalIdsImplToJson(_$ExternalIdsImpl instance) =>
    <String, dynamic>{
      'isrc': instance.isrc,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };
