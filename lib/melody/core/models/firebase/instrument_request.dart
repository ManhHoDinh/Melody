import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/instrument/instrument.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstrumentRequest {
  static Stream<List<Instrument>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Instruments').snapshots().map(
          (event) => event.docs
              .map((e) => Instrument.fromJson(e.data()))
              .where((instrument) =>
                  instrument.name
                      ?.toLowerCase()
                      ?.contains(searchValue.toLowerCase()) ??
                  false)
              .toList());

  static Future<String> getDescription(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('Instruments')
        .doc(id)
        .get();
    Instrument instrument = Instrument.fromJson(doc.data()!);
    return Future.value(instrument.description);
  }

  static Future<Instrument> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('Instruments')
        .doc(id)
        .get();
    Instrument instrument = Instrument.fromJson(doc.data()!);
    return Future.value(instrument);
  }
}
