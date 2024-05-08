import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:melody/melody/presentations/screens/music_recognition/musicRecognitionResult.dart';

class MusicRecognition extends StatefulWidget {
  const MusicRecognition({super.key});
  static const String routeName = 'music_recognition_screen';
  @override
  State<MusicRecognition> createState() => _MusicRecognitionState();
}


class _MusicRecognitionState extends State<MusicRecognition> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? path = result.files.single.path; // Get the selected file's path
      if (path != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MusicRecognitionResultScreen(path:path)));
         }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music recognition screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: pickAndUploadFile,
          child: Text('Upload and Analyze Audio'),
        ),
      ),
    );
  }
}
