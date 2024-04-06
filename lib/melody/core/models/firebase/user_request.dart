import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRequest {
  static Future<String> getName(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    UserModel user = UserModel.fromJson(doc.data()!);
    return Future.value(user.Name);
  }
}
