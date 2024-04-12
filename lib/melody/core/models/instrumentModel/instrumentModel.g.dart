// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrumentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstrumentModelImpl _$$InstrumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstrumentModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$InstrumentModelImplToJson(
        _$InstrumentModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
    };
