import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/image_helper.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/neu_box.dart';
import 'package:melody/melody/presentations/screens/queue/queue.dart';
import 'package:provider/provider.dart';

class Playing extends StatelessWidget {
  const Playing({super.key});
  static const String routeName = '/playing';
  // convert duration into min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      // get playlist
      final playlist = value.playlist;

      // get current song index
      final currentSong = playlist[value.currentSongIndex ?? 0];

      // return scaffold UI
      return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.keyboard_arrow_down)),
                      // title
                      Text("P L A Y I N G"),
                      // menu button
                      IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const Queue()),
                            // );
                            Get.toNamed('/queue');
                          },
                          icon: Icon(Icons.menu))
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // song artwork
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: NeuBox(
                        child: Column(
                      children: [
                        // image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageHelper.loadFromNetwork(
                            currentSong.songImagePath,
                            height: 320,
                            width: 320,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // song and artist name and fav icon
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // song and artist name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(currentSong.artistName)
                                  ],
                                ),

                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                                // heart icon
                              ]),
                        )
                      ],
                    )),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start time
                            Text(formatTime(value.currentDuration)),

                            // shuffle icon
                            IconButton(
                                onPressed: value.toggleShuffle,
                                icon: Icon(
                                  Icons.shuffle,
                                  color: value.isShuffle
                                      ? Colors.green
                                      : Colors.black,
                                )),

                            // repeat icon
                            IconButton(
                                onPressed: value.toggleRepeat,
                                icon: Icon(
                                  value.isRepeatOne
                                      ? Icons.repeat_one
                                      : Icons.repeat,
                                  color: Colors.green,
                                )),

                            // download icon
                            IconButton(
                                onPressed: value.downloadCurrentSong,
                                icon: Icon(Icons.download)),
                            // end time
                            Text(formatTime(value.totalDuration))
                          ],
                        ),
                      ),

                      // song duration progress
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 5)),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          onChanged: (double double) {
                            // when the user is sliding around
                          },
                          onChangeEnd: (double double) {
                            //sliding has finished, go to that position in the song duration
                            value.seek(Duration(seconds: double.toInt()));
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey.shade400,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // playback controls
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        // skip previous
                        Expanded(
                            child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: NeuBox(child: Icon(Icons.skip_previous)),
                        )),

                        const SizedBox(
                          width: 20,
                        ),
                        // play/pause
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: value.pauseOrResume,
                              child: NeuBox(
                                  child: Icon(value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow)),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        // // skip forward
                        Expanded(
                            child: GestureDetector(
                          onTap: value.playNextSong,
                          child: NeuBox(child: Icon(Icons.skip_next)),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 40),
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Song lyrics',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                            future: SongRequest.getLyricsOfSong(
                                currentSong.artistName, currentSong.songName),
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            }))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
