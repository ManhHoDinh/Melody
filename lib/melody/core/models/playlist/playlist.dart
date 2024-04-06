import 'package:freezed_annotation/freezed_annotation.dart';
part 'playlist.g.dart';
part 'playlist.freezed.dart';

@Freezed()
class Playlist with _$Playlist {
  const factory Playlist({
    required String name,
    @Default("") String description,
    required String id,
    @Default([]) List<String> songIds,
    required String image,
  }) = _Playlist;
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}
