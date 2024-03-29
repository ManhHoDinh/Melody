import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/user/user.dart';

class AlbumRequest {
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
}
