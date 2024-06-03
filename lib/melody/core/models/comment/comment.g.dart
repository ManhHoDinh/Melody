// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      comment: json['comment'] as String,
      time: json['time'] as String,
      day: json['day'] as String,
      songId: json['songId'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'comment': instance.comment,
      'time': instance.time,
      'day': instance.day,
      'songId': instance.songId,
    };
