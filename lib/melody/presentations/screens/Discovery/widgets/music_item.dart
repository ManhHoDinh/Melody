import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/music/music.dart';

class MusicItem extends StatelessWidget {
  
  final Music music;
  const MusicItem({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: AssetImage(music.image))),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Text(
            music.artist,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}