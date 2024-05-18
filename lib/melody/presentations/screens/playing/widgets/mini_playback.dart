import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';

class MiniPlaybackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, child) {
        if (playlistProvider.currentSongIndex == null) {
          return SizedBox
              .shrink(); // Không hiển thị nếu không có bài hát nào đang phát
        }
        final currentSong =
            playlistProvider.playlist[playlistProvider.currentSongIndex!];

        return GestureDetector(
          onTap: () {
            Get.toNamed('/playing');
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[850],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    currentSong.songImagePath,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentSong.songName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white)),
                      Text(currentSong.artistName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: playlistProvider.playPreviousSong,
                ),
                playlistProvider.isLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                      )
                    : IconButton(
                        icon: Icon(
                          playlistProvider.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: playlistProvider.pauseOrResume,
                      ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  onPressed: playlistProvider.playNextSong,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
