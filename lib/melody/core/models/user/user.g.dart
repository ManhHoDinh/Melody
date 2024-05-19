// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      Id: json['Id'] as String,
      Name: json['Name'] as String,
      Email: json['Email'] as String,
      playlistIds: (json['playlistIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      position: json['position'] as String? ?? "",
      songIds: (json['songIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Email': instance.Email,
      'playlistIds': instance.playlistIds,
      'position': instance.position,
      'songIds': instance.songIds,
    };
