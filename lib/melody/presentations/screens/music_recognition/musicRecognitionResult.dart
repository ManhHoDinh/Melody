import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/musicRecognitionResponse/music_recognition.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
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
  @override
  void initState() {
    super.initState();
    String apiToken = '634c1019bed3403fb91feb1cf368ceb2';
    String path = widget.path;
    uploadAudioAndCallAuddAPI(path, apiToken);
  }

Future<void> uploadAudioAndCallAuddAPI(String filePath, String apiToken) async {
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
      musicRecognitionResponse=MusicRecognitionResponse.fromJson(jsonDecode(value));
      // Process the response here. You may want to pass a callback to handle the response.
    });
  } catch (e) {
    // Handle any exceptions here
    print('Failed to upload file: $e');
    error = 'Failed to upload file: $e';
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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Title: ${musicRecognitionResponse!.result?.title}'),
                  Text('Artist: ${musicRecognitionResponse!.result?.artist}'),
                  Text('Album: ${musicRecognitionResponse!.result?.album}'),
                  Text(
                      'Release Date: ${musicRecognitionResponse?.result!.releaseDate}'),
                  Text('Label: ${musicRecognitionResponse!.result?.label}'),
                  Text(
                      'Spotify URL: ${musicRecognitionResponse?.result!.spotify != null ? musicRecognitionResponse?.result!.spotify!.externalUrls!.spotify : ""}'),
                  Text(
                      'Apple Music URL: ${musicRecognitionResponse?.result!.appleMusic != null ? musicRecognitionResponse?.result!.appleMusic!.isrc : ""}'),
                ],
              ),
      ),
    );
  }
}
