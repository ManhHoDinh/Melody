
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/comment/comment.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentrRequest {
  static Stream<List<Comment>> search(String searchValue) => FirebaseFirestore
      .instance
      .collection('Comment')
      .snapshots()
      .map((comment) => comment.docs
          .map((e) => Comment.fromJson(e.data()))
          .where((comment) =>
              comment.name?.toLowerCase()?.contains(searchValue.toLowerCase()) ??
              false)
          .toList());

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserFromId(
      String id) async {
    var document =
        await FirebaseFirestore.instance.collection("Users").doc(id).get();
    return document;
  }


}
