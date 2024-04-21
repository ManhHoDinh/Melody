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
      position: json['position'] as String? ?? "",
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Email': instance.Email,
      'position': instance.position,
    };
