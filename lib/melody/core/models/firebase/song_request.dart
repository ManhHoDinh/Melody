import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongRequest {
  static Stream<List<Song>> getAll(String artistId) => FirebaseFirestore
      .instance
      .collection('Songs')
      .where('artistId', isEqualTo: artistId)
      .snapshots()
      .map((event) => event.docs.map((e) => Song.fromJson(e.data())).toList());

  static Future<Song> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Songs').doc(id).get();
    Song song = Song.fromJson(doc.data()!);
    return Future.value(song);
  }
}
