import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/user/user.dart';

class PlaylistRequest {
  static Stream<List<Playlist>> getAll() => FirebaseFirestore.instance
      .collection('Playlists')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Playlist.fromJson(e.data())).toList());
  static Future<Playlist> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Playlists').doc(id).get();
    Playlist playlist = Playlist.fromJson(doc.data()!);
    return Future.value(playlist);
  }
}
