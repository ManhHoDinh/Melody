import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String name,
    required int id,
    required String comment,
    required DateTime time,
     required DateTime day,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) => _$CommentFromJson(json);


}
