import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.g.dart';
part 'song.freezed.dart';

List<DateTime> _sendAtFromJson(List<dynamic> timestamps) =>
    timestamps.map((timestamp) {
      Timestamp time = timestamp as Timestamp;
      return DateTime.fromMillisecondsSinceEpoch(
          timestamp.millisecondsSinceEpoch);
    }).toList();

List<Timestamp> _sendAtToJson(List<DateTime> times) =>
    times.map((time) => Timestamp.fromDate(time)).toList();

@Freezed()
class Song with _$Song {
  const factory Song(
      {required String songId,
      @Default("") String artistId,
      @Default("") String songName,
      @Default("") String artistName,
      @Default("") String songImagePath,
      @JsonKey(name: "times", fromJson: _sendAtFromJson, toJson: _sendAtToJson)
      @Default([])
      List<DateTime> times,
      @Default([]) List<String> commentsIds,
      @Default("") String audioPath}) = _Song;
      

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}