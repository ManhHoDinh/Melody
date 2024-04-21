import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/controller/songController.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongItem extends StatefulWidget {
  final Song item;
  final String playlistId;
  const SongItem({super.key, required this.item, required this.playlistId});

  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  @override
  Widget build(BuildContext context) {
    SongController songController = Get.find();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget.item.songImagePath),
                    fit: BoxFit.cover))),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.songName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        widget.item.artistName,
                        style: TextStyle(
                          color: ColorPalette.grayText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    songController.updateDisplaySongs(widget.item);
                    await PlaylistRequest.addSongToPlaylist(
                        widget.playlistId, widget.item.songId);
                    songController.updateSongOfPlaylist(widget.playlistId);
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}
