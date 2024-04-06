import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/user/user.dart';

class MusicRequest {
  static Stream<List<Music>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Albums').snapshots().map((event) =>
          event.docs
              .map((e) => Music.fromJson(e.data()))
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