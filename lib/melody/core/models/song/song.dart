import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.g.dart';
part 'song.freezed.dart';

@Freezed()
class Song with _$Song {
  const factory Song(
      {required String songName,
      required String artistName,
      required String songImagePath,
      required String audioPath}) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
