import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'widgets/music_item.dart';

class MusicSection extends StatelessWidget {
  final String title;
  final List<Music> albums;

  MusicSection({required this.title, required this.albums});

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
                  fontWeight: FontWeight.bold,),
            ),
            TextButton(
              onPressed: () {
                // Implement your logic to view more
              },
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
