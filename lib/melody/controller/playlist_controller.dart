import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';

class PlaylistController extends GetxController {
  RxList<Playlist> playlists = <Playlist>[].obs;
  void getPlaylist() async {
    List<Playlist> playlistsOfUser =
        await PlaylistRequest.getAll(FirebaseAuth.instance.currentUser!.uid)
            .first;
    playlists.value = playlistsOfUser;
  }

  bool checkExistedPlaylistName(String name) {
    return playlists.map((e) => e.name).toList().contains(name);
  }
}
