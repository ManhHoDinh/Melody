import 'package:freezed_annotation/freezed_annotation.dart';
part 'album.g.dart';
part 'album.freezed.dart';

@Freezed()
class Album with _$Album {
  const factory Album({
    required String name,
    required int id,
    required String artist,
    required String image,
  }) = _Album;
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
