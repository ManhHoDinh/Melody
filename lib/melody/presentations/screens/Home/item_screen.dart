import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/presentations/screens/Home/composer_screen.dart';
import 'package:melody/melody/presentations/screens/Home/instrument_screen.dart';
import 'package:melody/melody/presentations/screens/Home/perfomer_screen.dart';
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                switch (title) {
                  case 'Composer':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComposerScreen(albums: albums),
                      ),
                    );
                    break;
                  case 'Perfomer':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerfomerScreen(albums: albums),
                      ),
                    );
                    break;
                  case 'Instrument':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstrumentScreen(albums: albums),
                      ),
                    );
                    break;
                  default:
                    break;
                }
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
