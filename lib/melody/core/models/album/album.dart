import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/user/user.dart';
part 'album.g.dart';
part 'album.freezed.dart';

@Freezed()
class Album with _$Album {
  const factory Album({
    required String name,
    required String id,
    required String artist_id,
    required String image,
  }) = _Album;
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}