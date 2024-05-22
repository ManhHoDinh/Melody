// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfomer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerfomerImpl _$$PerfomerImplFromJson(Map<String, dynamic> json) =>
    _$PerfomerImpl(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      music: json['music'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$PerfomerImplToJson(_$PerfomerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'music': instance.music,
      'image': instance.image,
    };
