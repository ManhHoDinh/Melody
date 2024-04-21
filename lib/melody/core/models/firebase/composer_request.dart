import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/composer/composer.dart';

class ComposerRequest {
  static Future<Composer> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Composers').doc(id).get();
    Composer composer = Composer.fromJson(doc.data()!);
    return Future.value(composer);
  }

  static Stream<List<Composer>> getAll() => FirebaseFirestore.instance
      .collection('Composers')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Composer.fromJson(e.data())).toList());

  static Stream<Composer?> getStreamById(String id) {
    return FirebaseFirestore.instance
        .collection('Composers')
        .doc(id)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return Composer.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    });
  }
}
