import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/custom_button.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/custom_textfield.dart';

class UploadSongPage extends StatefulWidget {
  const UploadSongPage({super.key});

  @override
  State<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends State<UploadSongPage> {
  final artistController = TextEditingController();
  final songNameController = TextEditingController();

  PlatformFile? choosedImage;
  PlatformFile? choosedSong;

  Future selectImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'jpg',
      'png',
      'jpeg',
      'webp',
    ]);
    if (result == null) return;

    setState(() {
      choosedImage = result.files.first;
    });
  }

  Future selectSong() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );
    if (result == null) return;

    setState(() {
      choosedSong = result.files.first;
    });
  }

  Future uploadFilesToFirebase() async {
    // final artworkFile = File(choosedImage!.path!);
    // final songFile = File(choosedSong!.path!);

    // final artworkRef = FirebaseStorage.instance
    //     .ref()
    //     .child("song_artworks/${choosedImage!.name}");

    // final songRef =
    //     FirebaseStorage.instance.ref().child("song_files/${choosedSong!.name}");

    // artworkRef.putFile(artworkFile);
    // print(artworkFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('U P L O A D'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Artist",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: artistController,
                readOnly: true,
                hintText: "Dinh Dai Duong",
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Song name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: songNameController,
                readOnly: false,
                hintText: "Name your song",
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Song file",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                  onClick: selectSong,
                  bgColor: Color(0xff9C9C9C),
                  text: "Choose file",
                  textColor: Colors.white),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choosing file: " +
                    (choosedSong == null ? "" : choosedSong!.name!),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Song artwork",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "Tap to change song artwork",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: selectImage,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: choosedImage == null
                        ? Image.asset(
                            "assets/images/defaultartwork.jpg",
                            height: 209,
                            width: 209,
                          )
                        : Image.file(
                            File(choosedImage!.path!),
                            width: 209,
                            height: 209,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              CustomButton(
                  onClick: uploadFilesToFirebase,
                  bgColor: Color(0xff262626),
                  text: "Upload song",
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    ));
  }
}
