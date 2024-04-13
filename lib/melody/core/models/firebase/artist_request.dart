import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/artist/artist.dart';

class ArtistRequest {
  static Future<Artist> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Artists').doc(id).get();
    Artist artist = Artist.fromJson(doc.data()!);
    return Future.value(artist);
  }

  static Stream<Artist?> getStreamById(String id) {
    return FirebaseFirestore.instance
        .collection('Artists')
        .doc(id)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return Artist.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    });
  }
}
