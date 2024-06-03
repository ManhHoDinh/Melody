import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:melody/melody/controller/playlist_controller.dart';
import 'package:melody/melody/controller/songController.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/library/edit_playlist_screen.dart';
import 'package:melody/melody/presentations/library/widgets/song_sheet.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:melody/melody/presentations/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class DetailPlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const DetailPlaylistScreen({super.key, required this.playlist});

  @override
  State<DetailPlaylistScreen> createState() => _DetailPlaylistScreenState();
}

class _DetailPlaylistScreenState extends State<DetailPlaylistScreen> {
  SongController songController = Get.find();
  PlaylistController playlistController = Get.find();
  late PlaylistProvider playlistProvider;
  List<Song> songInAlbum = [];
  List<Song> songNotInAlbum = [];
  bool canModify = false;
  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    songController.updateSongOfPlaylist(widget.playlist.id);
    playlistController.getPlaylist();

    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
              text: 'Play',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D0B14)),
              children: <TextSpan>[
                TextSpan(
                  text: 'lists',
                  style: TextStyle(fontSize: 20, color: Color(0xff4059F1)),
                ),
              ],
            ),
          ),
        ),

        body: Obx(() {
          Playlist detailPlaylist = playlistController.playlists
              .firstWhere((element) => element.id == widget.playlist.id);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              detailPlaylist.image,
                            )),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailPlaylist.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(detailPlaylist.description,
                            style: TextStyle(fontSize: 16))
                      ],
                    ),
                  )
                ]),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              _playAll();
                            },
                            icon: Icon(
                              Icons.play_circle,
                              size: 60,
                              color: ColorPalette.primaryColor,
                            )),
                        Text(
                          'Play All',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  PlaylistRequest.deletePlaylist(
                                      detailPlaylist.id);
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: ColorPalette.primaryColor,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(EditPlaylistScreen(),
                                      arguments: widget.playlist.id);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: ColorPalette.primaryColor,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Track',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${detailPlaylist.songIds.length.toString()} tracks',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.bottomSheet(
                            isScrollControlled: true,
                            SongSheet(
                              playlistId: widget.playlist.id,
                            ));
                      },
                      child: Text(
                        'Add song to this playlist',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.primaryColor,
                      )),
                ),
                Obx(() {
                  return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => SongItem(
                                onTap: () {
                                  _onSongInAlbumTap(
                                      songController.songOfPlaylist[index]);
                                },
                                isInPlaylist: true,
                                // playlistType: widget.playlist.type,
                                playlistId: widget.playlist.id,
                                song: songController.songOfPlaylist[index],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: songController.songOfPlaylist.length));
                })
              ],
            ),
          );
        }));
  }

  void _playAll() {
    List<Song> copiedSongList = List.from(songController.songOfPlaylist);
    playlistProvider.playlist.clear();
    playlistProvider.setPlaylist(copiedSongList);
    playlistProvider.playAllFromIndex(0);
    Navigator.of(context).pushNamed(Playing.routeName);
  }

  void _onSongInAlbumTap(Song song) {
    List<Song> copiedSongList = List.from(songController.songOfPlaylist);

    // Set the copiedSongList to the playlistProvider
    playlistProvider.playlist.clear();
    playlistProvider.setPlaylist(copiedSongList);

    // Set the currentSongIndex and navigate to the playing screen
    playlistProvider.currentSongIndex = copiedSongList.indexOf(song);
    Navigator.of(context).pushNamed(Playing.routeName);
  }
}
