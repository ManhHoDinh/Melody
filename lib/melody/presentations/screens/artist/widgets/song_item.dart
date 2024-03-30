import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/song/song.dart';

class SongItem extends StatelessWidget {
  Song song;
  SongItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 2.5,
          ),
          Row(
            children: [
              Image.network(
                song.songImagePath,
                width: 49,
                height: 49,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 230,
                child: Text(
                  song.songName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/fav.png",
                height: 21,
                width: 21,
              ),
              SizedBox(
                width: 17,
              ),
              Image.asset(
                "assets/images/option.png",
                height: 24,
                width: 24,
              ),
            ],
          ),
          SizedBox(
            height: 2.5,
          ),
          Divider(
            color: Colors.grey.shade700,
          )
        ],
      ),
    );
  }
}
