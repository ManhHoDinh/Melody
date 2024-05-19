import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/user/user.dart';

import '../song/song.dart';

class AlbumRequest {
  static Future<Album> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Albums').doc(id).get();
    Album playlist = Album.fromJson(doc.data()!);
    return Future.value(playlist);
  }

  static Future<List<Song>> getSongOfAlbum(String albumId) async {
    Album album = await getById(albumId);
    List<Song> allSongs = await SongRequest.getAllSongs().first;
    return allSongs.where((e) => album.songIds.contains(e.songId)).toList();
  }

  static Stream<List<Album>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Albums').snapshots().map((event) =>
          event.docs
              .map((e) => Album.fromJson(e.data()))
              .where((album) =>
                  album.name.toLowerCase().contains(searchValue.toLowerCase()))
              .toList());
  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserFromId(
      String id) async {
    var document =
        await FirebaseFirestore.instance.collection("Users").doc(id).get();
    return document;
  }

  static Stream<List<Album>> getAlbumByID(String albumId) => FirebaseFirestore
      .instance
      .collection('Albums')
      .where('id', isEqualTo: albumId)
      .snapshots()
      .map((event) => event.docs.map((e) => Album.fromJson(e.data())).toList());
}
