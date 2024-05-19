// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistImpl _$$PlaylistImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistImpl(
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      id: json['id'] as String? ?? "",
      songIds: (json['songIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image: json['image'] as String? ?? "",
      type: json['type'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
    );

Map<String, dynamic> _$$PlaylistImplToJson(_$PlaylistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'songIds': instance.songIds,
      'image': instance.image,
      'type': instance.type,
      'userId': instance.userId,
    };
