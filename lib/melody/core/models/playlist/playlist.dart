import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
part 'playlist.g.dart';
part 'playlist.freezed.dart';

@Freezed()
class Playlist with _$Playlist {
  const factory Playlist(
      {@Default("") String name,
      @Default("") String description,
      @Default("") String id,
      @Default([]) List<String> songIds,
      @Default("") String image,
      @Default("") String type,
      @Default("") String userId}) = _Playlist;
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}
ll