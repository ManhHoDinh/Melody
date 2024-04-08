import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/instrumentModel/instrumentModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstrumentRequest {
  static Stream<InstrumentModel> search(String searchValue) => FirebaseFirestore
      .instance
      .collection('Instruments')
      .snapshots()
      .map((event) => event.docs
          .map((e) => InstrumentModel.fromJson(e.data()))
          .where((instrument) =>
              instrument.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList()[0]);
  static Future<String> getDescription(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('Instruments')
        .doc(id)
        .get();
    InstrumentModel instrument = InstrumentModel.fromJson(doc.data()!);
    return Future.value(instrument.description);
  }

  static Future<InstrumentModel> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('Instruments')
        .doc(id)
        .get();
    InstrumentModel instrument = InstrumentModel.fromJson(doc.data()!);
    return Future.value(instrument);
  }
}
