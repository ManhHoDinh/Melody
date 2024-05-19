import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static var playlistCollection =
      FirebaseFirestore.instance.collection("Playlists");
  static var albumCollection = FirebaseFirestore.instance.collection("Albums");
  static var songCollection = FirebaseFirestore.instance.collection("Songs");
  static var instrumentCollection =
      FirebaseFirestore.instance.collection("Instruments");
  static var eventCollection = FirebaseFirestore.instance.collection("Events");
  static var userCollection = FirebaseFirestore.instance.collection("Users");
  static var artistCollection =
      FirebaseFirestore.instance.collection("Artists");
  static var composerCollection =
      FirebaseFirestore.instance.collection("Composers");
  static String userId = FirebaseAuth.instance.currentUser!.uid;
}
