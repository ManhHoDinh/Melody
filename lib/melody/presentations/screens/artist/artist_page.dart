import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/screens/artist/upload_song_page.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/edit_button.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/play_all_button.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/upload_button.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:provider/provider.dart';

class ArtistPage extends StatefulWidget {
  ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  late PlaylistProvider playlistProvider;
  String artistId = Get.arguments;
  List<Song>? songList;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('A R T I S T'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: StreamBuilder<Artist?>(
              stream: ArtistRequest.getStreamById(artistId),
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
                  Artist artist = snapshot.data!;
                  return Container(
                    height: 800,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(360),
                              child: Image.network(
                                artist.avatar,
                                height: 120,
                                width: 120,
                              ),
                            ),
                            SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  artist.artistName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(artist.bio == ""
                                    ? "Artist bio"
                                    : artist.bio),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
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
                                Get.toNamed('/uploadSong');
                              },
                              child: UploadButton(),
                            ),
                            SizedBox(width: 31),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/editArtist', arguments: artistId);
                              },
                              child: EditButton(),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(height: 14),
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
                              stream: SongRequest.getAll(artistId),
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
                          stream: SongRequest.getAll(artistId),
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
                                    return GestureDetector(
                                      onTap: () {
                                        _onSongTap(index);
                                      },
                                      child: SongItem(song: songList![index]),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
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
      // Create a copy of the songList
      List<Song> copiedSongList = List.from(songList!);

      // Set the copiedSongList to the playlistProvider
      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList);

      // Set the currentSongIndex and navigate to the playing screen
      playlistProvider.currentSongIndex = index;
      Get.toNamed('/playing');
    }
  }
}
