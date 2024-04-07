// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      startAt: _sendAtFromJson(json['startAt'] as Timestamp),
      endAt: _sendAtFromJson(json['endAt'] as Timestamp),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
      'location': instance.location,
      'description': instance.description,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
    };

