import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/firebase/composer_request.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/composer/widgets/readmore_text.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:melody/melody/presentations/widgets/edit_button.dart';
import 'package:melody/melody/presentations/widgets/play_all_button.dart';
import 'package:melody/melody/presentations/widgets/upload_button.dart';
import 'package:provider/provider.dart';

class ComposerPage extends StatefulWidget {
  const ComposerPage({super.key});

  @override
  State<ComposerPage> createState() => _ComposerPageState();
}

class _ComposerPageState extends State<ComposerPage> {
  late PlaylistProvider playlistProvider;
  String composerId = Get.arguments;
  List<Song>? songList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<Composer?>(
          stream: ComposerRequest.getStreamById(composerId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading artist name'),
              );
            } else {
              Composer composer = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      height: 241,
                      child: Stack(children: [
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            composer.portrait,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 241,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color.fromRGBO(
                                      58, 42, 55, 0.9700000286102295),
                                  Color.fromRGBO(4, 16, 58, 0)
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: Icon(
                                Icons.arrow_back,
                                size: 25,
                              )),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 25,
                          right: 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                composer.composerName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ])),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 800,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ReadMoreText(text: composer.about, maxLines: 5),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _playAll();
                                },
                                child: PlayAllButton()),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/uploadSong', arguments: {
                                  'authorId': composer.composerId,
                                  'authorName': composer.composerName
                                });
                              },
                              child: UploadButton(),
                            ),
                            SizedBox(width: 31),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/editComposer',
                                    arguments: composer.composerId);
                              },
                              child: EditButton(),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "Tracks",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            StreamBuilder<List<Song>>(
                              stream: SongRequest.getAllByArtistId(
                                  composer.composerId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text("Error: Failed fetching songs"),
                                  );
                                } else {
                                  songList = snapshot.data;
                                  return Text(
                                    "${songList?.length ?? 0} tracks",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        StreamBuilder<List<Song>>(
                          stream:
                              SongRequest.getAllByArtistId(composer.composerId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("Error: Failed fetching songs"),
                              );
                            } else {
                              songList = snapshot.data;
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: songList!.length,
                                  itemBuilder: (context, index) {
                                    return SongItem(
                                      song: songList![index],
                                      onTap: () {
                                        print('hha');
                                        _onSongTap(index);
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    ));
  }

  void _playAll() {
    if (playlistProvider != null && songList != null) {
      List<Song> copiedSongList = List.from(songList!);
      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList!);
      playlistProvider.playAllFromIndex(0);
      Get.toNamed('/playing');
    }
  }

  void _onSongTap(int index) {
    if (playlistProvider != null && songList != null) {
      List<Song> copiedSongList = List.from(songList!);

      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList);

      playlistProvider.currentSongIndex = index;
      Get.toNamed('/playing');
    }
  }
}
