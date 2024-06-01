import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongItem extends StatelessWidget {
  final Song song;
  const SongItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(song.songImagePath))),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 100,
              child: Text(
                song.songName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 100,
              child: Text(
                song.artistName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
