import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfomerRequest {
  static Stream<List<Perfomer>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Perfomer').snapshots().map(
          (event) => event.docs
              .map((e) => Perfomer.fromJson(e.data()))
              .where((perfomer) =>
                  perfomer.name
                      ?.toLowerCase()
                      ?.contains(searchValue.toLowerCase()) ??
                  false)
              .toList());

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserFromId(
      String id) async {
    var document =
        await FirebaseFirestore.instance.collection("Users").doc(id).get();
    return document;
  }

  static Future<Perfomer> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Perfomer').doc(id).get();
    Map<String, dynamic>? data = doc.data();
    if (data != null) {
      // Check if the properties of the data are null before using them
      final name = data['name'] ?? '';
      final music = data['music'] ?? '';
      final id = data['id'] ?? '';
      final image = data['image'] ?? '';
      // Use the variables in your widget
      Perfomer perfomer = Perfomer(
        name: name,
        music: music, id: id, image: data['image'] ?? '',
        // Add other properties as needed
      );
      return Future.value(perfomer);
    } else {
      throw Exception('Document does not exist on the database');
    }
  }
}
