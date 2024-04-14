import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/core/models/user/user.dart';
part 'album.g.dart';
part 'album.freezed.dart';

@Freezed()
class Album with _$Album {
  const factory Album({
    @Default("") String name,
     @Default("") String id,
     @Default("") String artist_id,
     @Default("") String description,
     @Default("") String image,
     @Default([]) List<String> songIds,
  }) = _Album;
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
