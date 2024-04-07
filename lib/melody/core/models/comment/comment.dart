import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

DateTime _sendAtFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

@Freezed()
class Comment with _$Comment {
  factory Comment({
    required String name,
    required String id,
    required String comment,
    required String time,
    required String day,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }
}
