import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/album/album.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  const AlbumItem({super.key, required this.album});

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
                      fit: BoxFit.fitWidth, image: AssetImage(album.image))),
            ),
          ),
          Text(
            album.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
          ),
          Text(
            album.artist,
            style: TextStyle(fontSize: 12, color: Color(0xffe7e7e9)),
          ),
        ],
      ),
    );
  }
}
