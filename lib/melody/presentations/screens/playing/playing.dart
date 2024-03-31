import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/comment_item.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/neu_box.dart';
import 'package:melody/melody/presentations/screens/queue/queue.dart';
import 'package:provider/provider.dart';
import 'package:melody/melody/core/models/comment/comment.dart';
import 'package:comment_box/comment/comment.dart';

class Playing extends StatelessWidget {
  Playing({super.key});

  // convert duration into min:sec

  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  List<Comment> comment = [
    Comment(
      name: 'assets/images/avatar.png',
      comment:
          'Nice song, I love it if you can play it again i will be happy and grateful. Your voice is so sweet',
      day: DateTime.now(),
      time: DateTime.now(),
      id: 1,
    ),
  ];

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
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                    // title
                    Text("P L A Y I N G"),
                    // menu button
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Queue()),
                          );
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
                        child: Image.asset(currentSong.songImagePath),
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
                              onPressed: () {}, icon: Icon(Icons.download)),
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
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Comments",
                  textAlign: TextAlign.center,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                          radius: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    // Textbox
                    // Spacer
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Enter your comments',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                        itemCount: comment.length,
                        itemBuilder: (context, index) {
                          return CommentItem(
                            comment: comment[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )));
    });
  }
}
