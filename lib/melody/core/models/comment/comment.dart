
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';
@Freezed()
class Comment with _$Comment {
  factory Comment({
    required String name,
    required String id,
    required String comment,
    required String time,
    required String day,
    required String songId,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json)
    => _$CommentFromJson(json);
  
}