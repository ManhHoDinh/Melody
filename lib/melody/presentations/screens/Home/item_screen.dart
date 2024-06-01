import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'widgets/music_item.dart';

class MusicSection extends StatelessWidget {
  final String title;
  final List<Music> albums;
  void Function()? viewMoreAction = () {};
  MusicSection(
      {required this.title, required this.albums, this.viewMoreAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              viewMoreAction != null
                  ? TextButton(
                      onPressed: viewMoreAction ?? () {},
                      child: Text(
                        'View More',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 0),
        ],
      ),
    );
  }
}
