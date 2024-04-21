import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongRequest {
  static Stream<List<Song>> getAllByArtistId(String artistId) =>
      FirebaseFirestore.instance
          .collection('Songs')
          .where('artistId', isEqualTo: artistId)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => Song.fromJson(e.data())).toList());

  static Future<Song> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Songs').doc(id).get();
    Song song = Song.fromJson(doc.data()!);
    return Future.value(song);
  }

  static List<Song> AllSongs = [];

  static List<Timestamp> _sendAtToJson(List<DateTime> times) =>
      times.map((time) => Timestamp.fromDate(time)).toList();
  static Stream<List<Song>> getAllSongs() => FirebaseFirestore.instance
      .collection('Songs')
      .snapshots()
      .map((event) => event.docs.map((e) => Song.fromJson(e.data())).toList());
  static Future<void> updateCount(String songId) async {
    var songDoc =
        await FirebaseFirestore.instance.collection('Songs').doc(songId).get();
    Song song = Song.fromJson(songDoc.data()!);
    List<DateTime> times = song.times;
    times.add(DateTime.now());
    FirebaseFirestore.instance
        .collection('Songs')
        .doc(songId)
        .update({"times": _sendAtToJson(times)});
  }
}
