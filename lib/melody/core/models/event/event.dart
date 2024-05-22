import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.g.dart';
part 'event.freezed.dart';

DateTime _sendAtFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

@Freezed()
class Event with _$Event {
  const factory Event(
      {required String name,
      required String id,
      required String image,
      required String location,
      required String description,
      required String startAt,
      required String endAt}) = _Event;
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
