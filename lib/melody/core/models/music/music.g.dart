// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicImpl _$$MusicImplFromJson(Map<String, dynamic> json) => _$MusicImpl(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      artist: json['artist'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$MusicImplToJson(_$MusicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'artist': instance.artist,
      'image': instance.image,
    };
