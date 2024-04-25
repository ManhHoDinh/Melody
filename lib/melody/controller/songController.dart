import 'package:get/get.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongController extends GetxController {
  RxList<Song> displayedSongs = <Song>[].obs;
  RxList<Song> songOfPlaylist = <Song>[].obs;
  RxList<Song> favoriteSongs = <Song>[].obs;
  void initFavoriteSong() async {
    favoriteSongs.value = await PlaylistRequest.getFavoriteSongs();
  }

  void resetDisplaySongs(String playlistId) async {
    List<Song> songs = await SongRequest.getAllSongs().first;
    List<Song> songOfPlaylist =
        await PlaylistRequest.getSongOfPlaylist(playlistId);
    displayedSongs.value =
        songs.where((element) => !songOfPlaylist.contains(element)).toList();
    List<Song> favoritePlaylist = await PlaylistRequest.getFavoriteSongs();
    print(favoritePlaylist);
  }

  void updateDisplaySongs(Song song) async {
    displayedSongs.removeWhere((element) => element.songId == song.songId);
  }

  void updateSongOfPlaylist(String playlistId) async {
    songOfPlaylist.value = await PlaylistRequest.getSongOfPlaylist(playlistId);
  }
}
