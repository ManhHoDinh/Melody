import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/core/models/firebase/user_request.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

class UploadSongPage extends StatefulWidget {
  const UploadSongPage({super.key});

  @override
  State<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends State<UploadSongPage> {
  final artistController = TextEditingController();
  final songNameController = TextEditingController();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  File? choosedImage;
  File? choosedSong;
  String? artworkDownloadUrl;
  String? songDownloadUrl;
  final Map<String, dynamic> arguments = Get.arguments ?? {};
  late String authorName;
  late String authorId;

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
      choosedImage = File(result.files.single.path!);
    });
  }

  Future selectSong() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['mp3', 'wav', 'acc']);
    if (result == null) return;

    setState(() {
      choosedSong = File(result.files.single.path!);
    });
  }

  void initState() {
    super.initState();
    authorName = arguments['authorName'] ?? '';
    authorId = arguments['authorId'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, // add navigation to the previous page
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
                maxLines: 1,
                controller: artistController,
                readOnly: true,
                hintText: authorName,
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
                maxLines: 1,
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
                    (choosedSong == null ? "" : choosedSong!.path),
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
              FutureBuilder<Artist>(
                future: ArtistRequest.getById(mAuth.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomButton(
                      onClick: () {},
                      bgColor: Color(0xff262626),
                      text: "Upload song",
                      textColor: Colors.white,
                    );
                  } else if (snapshot.hasError) {
                    return CustomButton(
                      onClick: () {},
                      bgColor: Color(0xff262626),
                      text: "Error", // Placeholder text if there's an error
                      textColor: Colors.white,
                    );
                  } else {
                    return CustomButton(
                      onClick: () async {
                        try {
                          if (songNameController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter a name for your song!");
                            return;
                          }
                          if (choosedSong == null) {
                            Fluttertoast.showToast(
                                msg:
                                    "Please choose a song you want to upload!");
                            return;
                          }

                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Uploading",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                );
                              });
                          String songId =
                              FirebaseHelper.songCollection.doc().id;

                          final songFile = path.basename(choosedSong!.path);
                          final songExtension =
                              path.extension(choosedSong!.path);
                          final uploadedSongFileName =
                              songFile.endsWith(songExtension)
                                  ? songFile
                                  : '$songFile$songExtension';
                          final songRef = FirebaseStorage.instance
                              .ref()
                              .child("song_files/$uploadedSongFileName");

                          final user = mAuth.currentUser;
                          if (user != null) {
                            try {
                              UploadTask songUploadTask =
                                  songRef.putFile(choosedSong!);
                              await Future.wait([songUploadTask]);
                              songDownloadUrl = await songRef.getDownloadURL();

                              if (choosedImage != null) {
                                final artworkFile =
                                    path.basename(choosedImage!.path);
                                final artworkRef = FirebaseStorage.instance
                                    .ref()
                                    .child("song_artworks/$artworkFile");
                                UploadTask artworkUploadTask =
                                    artworkRef.putFile(choosedImage!);
                                await Future.wait([artworkUploadTask]);
                                artworkDownloadUrl =
                                    await artworkRef.getDownloadURL();
                              }
                              Song newSong = Song(
                                songId: songId,
                                artistId: authorId,
                                songName: songNameController.text,
                                artistName: authorName,
                                songImagePath: artworkDownloadUrl !=
                                        null // default artwork if user didn't choose an image
                                    ? artworkDownloadUrl.toString()
                                    : "https://firebasestorage.googleapis.com/v0/b/melody-bf3aa.appspot.com/o/song_artworks%2Fdefaultartwork.jpg?alt=media&token=4146ab52-7d77-428f-bb5f-2741e662d20c",
                                audioPath: songDownloadUrl.toString(),
                              );

                              FirebaseHelper.songCollection
                                  .doc(songId)
                                  .set(newSong.toJson())
                                  .whenComplete(
                                      () => Navigator.of(context).pop());

                              Fluttertoast.showToast(
                                  msg: "Upload song successfully!");

                              // add navigation to exit uploading page
                              Get.back();
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            print("User's not signed in");
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      bgColor: Color(0xff262626),
                      text: "Upload song",
                      textColor: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
