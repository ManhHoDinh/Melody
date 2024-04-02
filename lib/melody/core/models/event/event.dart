import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.g.dart';
part 'event.freezed.dart';

@Freezed()
class Event with _$Event {
  const factory Event({
    required String name,
    required int id,
    required String image,
    required String location,
    required String description,
    required DateTime startAt,
    required DateTime endAt,
  }) = _Event;
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}