import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/edit_button.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/play_all_button.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/upload_button.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  Song testSong = Song(
      songId: "",
      artistId: "",
      songName: "Fur Elise",
      artistName: "",
      songImagePath:
          "https://firebasestorage.googleapis.com/v0/b/melody-bf3aa.appspot.com/o/song_artworks%2Ffurelise.jpg?alt=media&token=fd801dd4-bfb7-4cb0-b4ea-e3ba77cd7611",
      audioPath: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('A R T I S T'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.asset(
                        "assets/images/furelise.jpg",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dinh Dai Duong",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text("Artist Bio")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    PlayAllButton(),
                    Spacer(),
                    UploadButton(),
                    SizedBox(
                      width: 31,
                    ),
                    EditButton(),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Text(
                      "Tracks",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      "0 tracks",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SongItem(song: testSong),
                SongItem(song: testSong),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
