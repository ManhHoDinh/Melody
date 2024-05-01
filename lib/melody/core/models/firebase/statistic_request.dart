import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/core/models/user/user.dart';

class StatisticRequest {
  static List<String> top5AlbumName = [];
  static Stream<int> getCountSongs() {
    int total = 0;
    StreamController<int> streamController = StreamController<int>();
    FirebaseFirestore.instance.collection('Songs').snapshots().forEach((event) {
      event.docs.forEach((element) {
        Song song = Song.fromJson(element.data());
        song.times.forEach((element) {
          Duration difference = element.difference(DateTime.now());
          if (difference.inDays < 30) {
            total++;
          }
        });
      });
      streamController.add(total);
    });

    return streamController.stream;
  }

  static Stream<List<double>> getPlayStatistic() {
    DateTime dateTime = DateTime.now();
    int count = 1;
    StreamController<List<double>> streamController =
        StreamController<List<double>>();
    List<double> listCounts = [];
    FirebaseFirestore.instance
        .collection("Songs")
        .snapshots()
        .listen((querySnapshot) {
      while (count <= 30) {
        DateTime timeData = dateTime.subtract(Duration(days: count));
        int plays = 0;
        print(timeData);
        for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
            in querySnapshot.docs) {
          Song song = Song.fromJson(documentSnapshot.data());
          List<DateTime> times = song.times;

          times.forEach((time) {
            print(time);

            if (time.year == timeData.year &&
                time.month == timeData.month &&
                time.day == timeData.day) {
              plays++;
            }
          });
        }

        listCounts.add(plays.toDouble());
        count++;
      }
      streamController.add(listCounts.reversed.toList());
    });
    return streamController.stream;
  }

  static Future<List<Map<String, dynamic>>> getTop5Album() async {
    var listDoc = await FirebaseFirestore.instance.collection('Albums').get();
    List<Map<String, dynamic>> countedAlbums = [];
    for (var doc in listDoc.docs) {
      Album album = Album.fromJson(doc.data());
      List<Song> songs = await AlbumRequest.getSongOfAlbum(album.id);
      countedAlbums.add({"album": album, "count": getCountSongsOfAlbum(songs)});
    }
    countedAlbums.sort((a, b) => b["count"].compareTo(a["count"]));
    countedAlbums.forEach((element) {
      top5AlbumName.add(element["album"].name);
    });
    return countedAlbums.take(5).toList();
  }

  static int getCountSongsOfAlbum(List<Song> songs) {
    DateTime dateTime = DateTime.now();
    int count = 1;
    int plays = 0;
    while (count <= 30) {
      DateTime timeData = dateTime.subtract(Duration(days: count));

      for (Song song in songs) {
        List<DateTime> times = song.times;
        times.forEach((time) {
          if (time.year == timeData.year &&
              time.month == timeData.month &&
              time.day == timeData.day) {
            plays++;
          }
        });
      }

      count++;
    }
    return plays;
  }
}
