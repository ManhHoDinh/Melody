import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:melody/melody/core/models/musicRecognitionResponse/music_recognition.dart';
import 'package:dio/dio.dart';

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

  Future<void> uploadAudioAndCallAuddAPI(
      String filePath, String apiToken) async {
    // URL provided by the API documentation
    final String apiUrl = 'https://api.audd.io/';

    Dio dio = Dio();

    // Prepare the API request
    FormData formData = FormData.fromMap({
      'return': 'spotify',
      'api_token': apiToken,
      'file': await MultipartFile.fromFile(filePath),
    });

    // Send the request
    try {
      Response response = await dio.post(
        apiUrl,
        data: formData,
      );

      // Process the response
      setState(() {
        print(response.data);
        musicRecognitionResponse =
            MusicRecognitionResponse.fromJson(jsonDecode(response.data));
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
