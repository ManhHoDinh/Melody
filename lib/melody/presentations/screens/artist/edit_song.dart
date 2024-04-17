import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:path/path.dart' as path;

class EditSong extends StatefulWidget {
  const EditSong({super.key});

  @override
  State<EditSong> createState() => _EditSongState();
}

class _EditSongState extends State<EditSong> {
  final songNameController = TextEditingController();
  File? choosedImage;
  String? artworkDownloadUrl;
  String songId = Get.arguments;
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
              title: Text('S O N G   I N F O'),
            ),
            body: FutureBuilder<Song>(
              future: SongRequest.getById(songId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Loading")
                    ],
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading song information'),
                  );
                } else {
                  songNameController.text = snapshot.data!.songName;
                  return SingleChildScrollView(
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
                            "Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
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
                            "Artwork",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Tap to change song artwork",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: selectImage,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: choosedImage == null
                                    ? Image.network(
                                        snapshot.data!.songImagePath,
                                        height: 209,
                                        width: 209,
                                        fit: BoxFit.cover,
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
                            onClick: () async {
                              try {
                                if (songNameController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter your song name!");
                                  return;
                                }

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Updating",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      );
                                    });

                                final user =
                                    FirebaseAuth.instance.currentUser!.uid;
                                if (user != null) {
                                  try {
                                    Map<String, dynamic> updatedData;
                                    if (choosedImage != null) {
                                      final imageFile =
                                          path.basename(choosedImage!.path);
                                      final imageRef = FirebaseStorage.instance
                                          .ref()
                                          .child("song_artworks/$imageFile");
                                      UploadTask artworkUploadTask =
                                          imageRef.putFile(choosedImage!);
                                      await Future.wait([artworkUploadTask]);
                                      artworkDownloadUrl =
                                          await imageRef.getDownloadURL();
                                      print(artworkDownloadUrl);

                                      updatedData = {
                                        'songName': songNameController.text,
                                        'songImagePath':
                                            artworkDownloadUrl.toString(),
                                      };
                                    } else {
                                      updatedData = {
                                        'songName': songNameController.text,
                                      };
                                    }
                                    await FirebaseHelper.songCollection
                                        .doc(songId)
                                        .update(updatedData)
                                        .whenComplete(
                                            () => Navigator.of(context).pop());

                                    Fluttertoast.showToast(
                                        msg: "Upload song successfully!");

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
                            text: "Save changes",
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            )));
  }
}
