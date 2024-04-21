import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/core/models/user/user.dart';

class PlaylistRequest {
  static Stream<List<Playlist>> getAll() => FirebaseFirestore.instance
      .collection('Playlists')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Playlist.fromJson(e.data())).toList());
  static Future<Playlist> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Playlists').doc(id).get();
    Playlist playlist = Playlist.fromJson(doc.data()!);
    return Future.value(playlist);
  }

  static Future<void> addSongToPlaylist(
      String playlistId, String songId) async {
    Playlist playlist = await getById(playlistId);
    List<String> songs = List.from(playlist.songIds);
    songs.add(songId);

    await FirebaseHelper.playlistCollection
        .doc(playlistId)
        .update({"songIds": songs});
  }

  static Future<List<Song>> getSongOfPlaylist(String playlistId) async {
    Playlist playlist = await getById(playlistId);
    List<Song> allSongs = await SongRequest.getAllSongs().first;
    return allSongs.where((e) => playlist.songIds.contains(e.songId)).toList();
  }

  static Future<void> removeSongFromPlaylist(
      String playlistId, String songId) async {
    Playlist playlist = await getById(playlistId);
    List<String> songs = List.from(playlist.songIds);
    songs.remove(songId);
    await FirebaseHelper.playlistCollection
        .doc(playlistId)
        .update({"songIds": songs});
  }
}
