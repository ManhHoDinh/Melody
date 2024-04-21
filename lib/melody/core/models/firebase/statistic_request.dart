import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/core/models/user/user.dart';

class StatisticRequest {
  // static Stream<List<Statistic>> getAll() => FirebaseFirestore.instance
  //     .collection('Statistics')
  //     .snapshots()
  //     .map((event) =>
  //         event.docs.map((e) => Statistic.fromJson(e.data())).toList());
  // static Future<Statistic> getById(String id) async {
  //   DocumentSnapshot<Map<String, dynamic>> doc =
  //       await FirebaseFirestore.instance.collection('Statistics').doc(id).get();
  //   Statistic playlist = Statistic.fromJson(doc.data()!);
  //   return Future.value(playlist);
  // }
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
}
