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
    return Column(
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
                  color: Colors.white),
            ),
            TextButton(
              onPressed: viewMoreAction ?? () {},
              child: Text(
                'View More',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
