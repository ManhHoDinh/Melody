import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class SongRequest {
  static Stream<List<Song>> getAllByArtistId(String artistId) =>
      FirebaseFirestore.instance
          .collection('Songs')
          .where('artistId', isEqualTo: artistId)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => Song.fromJson(e.data())).toList());

  static Future<Song> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Songs').doc(id).get();
    Song song = Song.fromJson(doc.data()!);
    return Future.value(song);
  }

  static List<Song> AllSongs = [];

  static List<Timestamp> _sendAtToJson(List<DateTime> times) =>
      times.map((time) => Timestamp.fromDate(time)).toList();
  static Stream<List<Song>> getAllSongs() => FirebaseFirestore.instance
      .collection('Songs')
      .snapshots()
      .map((event) => event.docs.map((e) => Song.fromJson(e.data())).toList());
  static Future<void> updateCount(String songId) async {
    var songDoc =
        await FirebaseFirestore.instance.collection('Songs').doc(songId).get();
    Song song = Song.fromJson(songDoc.data()!);
    List<DateTime> times = List.from(song.times);
    times.add(DateTime.now());
    FirebaseFirestore.instance
        .collection('Songs')
        .doc(songId)
        .update({"times": _sendAtToJson(times)});
  }

  static Future<void> downloadSong(String audioPath, String songName) async {
    // Request storage permissions
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      throw Exception('Storage permission not granted');
    }

    // Get the directory to save the file
    Directory? externalDir = await getExternalStorageDirectory();
    if (externalDir == null) {
      throw Exception('Unable to get external storage directory');
    }
    String savePath = '${externalDir.path}/$songName.mp3';

    try {
      // Create a reference to the file you want to download
      Reference ref = FirebaseStorage.instance.refFromURL(audioPath);

      // Start the download
      File downloadToFile = File(savePath);
      await ref.writeToFile(downloadToFile);

      print('File downloaded to $savePath');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}
