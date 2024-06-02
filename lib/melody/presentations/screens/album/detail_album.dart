import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/image_helper.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/presentations/screens/album/modify_album.dart';
import 'package:melody/melody/presentations/screens/album/widgets/songInAlbumWidget.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/widgets/edit_button.dart';
import 'package:provider/provider.dart';
import 'package:melody/melody/presentations/widgets/play_all_button.dart';
import '../../../core/models/song/song.dart';

import '../artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/widgets/upload_button.dart';
import '../playing/playlist_provider.dart';

class AlbumDetailScreen extends StatefulWidget {
  AlbumDetailScreen({super.key, required this.album});
  Album album;

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  late PlaylistProvider playlistProvider;
  List<Song> songInAlbum = [];
  List<Song> songNotInAlbum = [];
  bool canModify = false;
  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
    canModify =
        (FirebaseAuth.instance.currentUser!.uid == widget.album.artist_id);
    ChangeSongsList();
  }

  void ChangeSongsList() {
    songInAlbum = SongRequest.AllSongs.where(
        (element) => widget.album.songIds.contains(element.songId)).toList();
    songNotInAlbum = SongRequest.AllSongs.where(
        (element) => !widget.album.songIds.contains(element.songId)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<List<Album>>(
            stream: AlbumRequest.getAlbumByID(widget.album.id),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for data, show a loading indicator
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If there's an error with the stream, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                widget.album = snapshot.data!.first;
                ChangeSongsList();
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          child: Row(
                            children: [
                              ImageHelper.loadFromNetwork(widget.album.image,
                                  radius: BorderRadius.all(Radius.circular(10)),
                                  fit: BoxFit.fitWidth,
                                  width: 150),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(widget.album.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(widget.album.description,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
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
                            canModify
                                ? Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Are you sure you want to delete this album?"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Cancel")),
                                                    TextButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Albums')
                                                              .doc(widget
                                                                  .album.id)
                                                              .delete();
                                                          Navigator.of(context)
                                                              .pop();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Delete"))
                                                  ],
                                                );
                                              });
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              size: 31,
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Delete",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 31),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ModifyAlbum(
                                                        album: widget.album,
                                                      )));
                                        },
                                        child: EditButton(),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  )
                                : Container(),
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
                            Text(
                              "${songInAlbum.length} tracks",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        ...songInAlbum.map((e) => SongItemInAlbum(
                              song: e,
                              onTap: () {
                                _onSongInAlbumTap(e);
                              },
                              onDeleteTap: () async {
                                print("Removed song to album");
                                final docAlbum = await FirebaseFirestore
                                    .instance
                                    .collection('Albums')
                                    .doc(widget.album.id);
                                // Make a copy of the songIds list
                                List<String> updatedSongIds =
                                    List.from(widget.album.songIds);

                                // Remove the song ID from the copied list
                                updatedSongIds.remove(e.songId);

                                docAlbum.update({'songIds': updatedSongIds});

                                print("Removed song to album");
                              },
                            )),
                        canModify
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 25),
                                  Text("Recommended Songs",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  SizedBox(height: 25),
                                  ...songNotInAlbum.map((e) => SongItemInAlbum(
                                        song: e,
                                        onTap: () {
                                          _onSongNotInAlbumTap(e);
                                        },
                                        onAddTap: () async {
                                          final docAlbum =
                                              await FirebaseFirestore.instance
                                                  .collection('Albums')
                                                  .doc(widget.album.id);

                                          docAlbum.update({
                                            'songIds': [
                                              ...widget.album.songIds,
                                              e.songId
                                            ]
                                          });
                                        },
                                      )),
                                ],
                              )
                            : Container(),
                      ]),
                );
              }
            })),
      ),
    );
  }

  void _playAll() {
    if (playlistProvider != null && songInAlbum != null) {
      List<Song> copiedSongList = List.from(songInAlbum!);
      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList!);
      playlistProvider.playAllFromIndex(0);
      Navigator.of(context).pushNamed(Playing.routeName);
    }
  }

  void _onSongInAlbumTap(Song song) {
    List<Song> copiedSongList = List.from(songInAlbum);

    // Set the copiedSongList to the playlistProvider
    playlistProvider.playlist.clear();
    playlistProvider.setPlaylist(copiedSongList);

    // Set the currentSongIndex and navigate to the playing screen
    playlistProvider.currentSongIndex = copiedSongList.indexOf(song);
    Navigator.of(context).pushNamed(Playing.routeName);
  }

  void _onSongNotInAlbumTap(Song song) {
    List<Song> copiedSongList = [song];

    // Set the copiedSongList to the playlistProvider
    playlistProvider.playlist.clear();
    playlistProvider.setPlaylist(copiedSongList);

    // Set the currentSongIndex and navigate to the playing screen
    playlistProvider.currentSongIndex = 0;
    Navigator.of(context).pushNamed(Playing.routeName);
  }
}
