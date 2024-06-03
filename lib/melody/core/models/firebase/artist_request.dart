import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:melody/melody/core/models/artist/artist.dart';

class ArtistRequest {
  static Future<Artist> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Artists').doc(id).get();
    Artist artist = Artist.fromJson(doc.data()!);
    return Future.value(artist);
  }
static Stream<List<Artist>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Artists').snapshots().map((event) =>
          event.docs
              .map((e) => Artist.fromJson(e.data()))
              .where((event) =>
                  event.artistName.toLowerCase().contains(searchValue.toLowerCase()))
              .toList());
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
