import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:provider/provider.dart';

class Queue extends StatefulWidget {
  const Queue({super.key});
  static final String routeName = 'home_screen';

  @override
  State<Queue> createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to a song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;
    // navigate to playing page
    Navigator.push(context, MaterialPageRoute(builder: (context) => Playing()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Q U E U E")),
        body: Consumer<PlaylistProvider>(
          builder: (context, value, child) {
            //get the playlist
            final List<Song> playlist = value.playlist;

            //return list view UI
            return ListView.builder(
                itemCount: playlist.length,
                itemBuilder: (context, index) {
                  final Song song = playlist[index];

                  return ListTile(
                    title: Text(song.songName),
                    subtitle: Text(song.artistName),
                    leading: Image.asset(song.songImagePath),
                    onTap: () => goToSong(index),
                  );
                });
          },
        ));
  }
}
