import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/user/user.dart';

class EventRequest {
  static Future<Event> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Events').doc(id).get();
    Event event = Event.fromJson(doc.data()!);
    return Future.value(event);
  }
  static Stream<List<Event>> search(String searchValue) =>
      FirebaseFirestore.instance.collection('Events').snapshots().map((event) =>
          event.docs
              .map((e) => Event.fromJson(e.data()))
              .where((event) =>
                  event.name.toLowerCase().contains(searchValue.toLowerCase()))
              .toList());
}
