// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      songId: json['songId'] as String,
      artistId: json['artistId'] as String,
      songName: json['songName'] as String,
      artistName: json['artistName'] as String,
      songImagePath: json['songImagePath'] as String,
      audioPath: json['audioPath'] as String,
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'artistId': instance.artistId,
      'songName': instance.songName,
      'artistName': instance.artistName,
      'songImagePath': instance.songImagePath,
      'audioPath': instance.audioPath,
    };