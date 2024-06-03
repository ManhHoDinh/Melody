import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/musicRecognitionResponse/music_recognition.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:melody/melody/presentations/screens/artist/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/models/firebase/song_request.dart';
import '../../../core/models/song/song.dart';

class MusicRecognitionResultScreen extends StatefulWidget {
  MusicRecognitionResultScreen({super.key, required this.path});
  String path;
  @override
  State<MusicRecognitionResultScreen> createState() =>
      _MusicRecognitionResultScreenState();
}

class _MusicRecognitionResultScreenState
    extends State<MusicRecognitionResultScreen> {
  MusicRecognitionResponse? musicRecognitionResponse;
  String error = '';
  Song? songResult;
  late PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    String apiToken = 'ee80bfd4b3735cd079587b4e6f90321e';
    String path = widget.path;
    uploadAudioAndCallAuddAPI(path, apiToken);
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  Future<void> uploadAudioAndCallAuddAPI(
      String filePath, String apiToken) async {
    // URL provided by the API documentation
    final String apiUrl = 'https://api.audd.io/';

    // Prepare the API request
    var uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest('POST', uri)
      ..fields['return'] = 'apple_music,spotify'
      ..fields['api_token'] = apiToken;

    // Add the file to the request
    var file = await http.MultipartFile.fromPath('file', filePath);
    request.files.add(file);

    // Send the request
    try {
      var response = await request.send();

      // Listen for the response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        setState(() {
          musicRecognitionResponse =
              MusicRecognitionResponse.fromJson(jsonDecode(value));
        });
        // Process the response here. You may want to pass a callback to handle the response.
      });
    } catch (e) {
      // Handle any exceptions here
      print('Failed to upload file: $e');
      setState(() {
        error = 'Failed to upload file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Recognition Result'),
      ),
      body: Center(
          child: musicRecognitionResponse == null
              ? error.isNotEmpty
                  ? Text(error)
                  : CircularProgressIndicator()
              : StreamBuilder<List<Song>>(
                  stream: SongRequest.getAllSongs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: Failed fetching songs"),
                      );
                    } else {
                      if (snapshot.data != null) {
                        try {
                          songResult = snapshot.data!.firstWhere((element) {
                            if (musicRecognitionResponse!.result!.title != null) {
                              return element.songName.contains(
                                      musicRecognitionResponse!
                                          .result!.title!) ||
                                  musicRecognitionResponse!.result!.title!
                                      .contains(element.songName);
                            }
                            return false;
                          });
                        } catch (e) {
                          print('Song not found');
                        }
                      }
                      return songResult != null
                          ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SongItem(
                                song: songResult!,
                                onTap: () {
                                  _onSongTap();
                                },
                              ),
                          )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Title: ${musicRecognitionResponse!.result?.title ?? ""}'),
                                Text(
                                    'Artist: ${musicRecognitionResponse!.result?.artist}'),
                                Text(
                                    'Album: ${musicRecognitionResponse!.result?.album}'),
                                Text(
                                    'Release Date: ${musicRecognitionResponse?.result!.releaseDate}'),
                                Text(
                                    'Label: ${musicRecognitionResponse!.result?.label}'),
                                Text(
                                    'Spotify URL: ${musicRecognitionResponse?.result!.spotify != null ? musicRecognitionResponse?.result!.spotify!.externalUrls!.spotify : ""}'),
                                Text(
                                    'Apple Music URL: ${musicRecognitionResponse?.result!.appleMusic != null ? musicRecognitionResponse?.result!.appleMusic!.isrc : ""}'),
                              ],
                            );
                    }
                  },
                )),
    );
  }

  void _onSongTap() {
    if (playlistProvider != null && songResult != null) {
      // Create a copy of the songList
      List<Song> copiedSongList = [songResult!];

      // Set the copiedSongList to the playlistProvider
      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList);

      // Set the currentSongIndex and navigate to the playing screen
      playlistProvider.currentSongIndex = 0;
      Navigator.of(context).pushNamed(Playing.routeName);
    }
  }
}
