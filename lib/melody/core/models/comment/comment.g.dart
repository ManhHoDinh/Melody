// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) => _$CommentImpl(
      name: json['name'] as String,
      id: json['id'] as int,
      comment: json['comment'] as String,
      day: json['day'] as DateTime,
      time: json['time'] as DateTime,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'comment': instance.comment,
      'day': instance.day,
      'time': instance.time,
    };