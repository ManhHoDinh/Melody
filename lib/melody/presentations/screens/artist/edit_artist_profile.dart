import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:path/path.dart' as path;

class EditArtist extends StatefulWidget {
  const EditArtist({super.key});

  @override
  State<EditArtist> createState() => _EditArtistState();
}

class _EditArtistState extends State<EditArtist> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  String artistId = Get.arguments;
  File? choosedImage;
  String? avatarDownloadUrl;

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
          title: Text('A R T I S T   I N F O'),
        ),
        body: FutureBuilder<Artist>(
          future: ArtistRequest.getById(artistId),
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
                child: Text('Error loading artist information'),
              );
            } else {
              nameController.text = snapshot.data!.artistName;
              bioController.text = snapshot.data!.bio;
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
                        controller: nameController,
                        readOnly: false,
                        hintText: "Enter your artist name",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        maxLines: 3,
                        controller: bioController,
                        readOnly: false,
                        hintText: "Write something about you.",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Avatar",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Tap to change your avatar",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
                                ? Image.network(
                                    snapshot.data!.avatar,
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
                        onClick: () async {
                          try {
                            if (nameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter your artist name!");
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

                            final user = FirebaseAuth.instance.currentUser!.uid;
                            if (user != null) {
                              try {
                                Map<String, dynamic> updatedData;
                                if (choosedImage != null) {
                                  final imageFile =
                                      path.basename(choosedImage!.path);
                                  final imageRef = FirebaseStorage.instance
                                      .ref()
                                      .child("images/$imageFile");
                                  UploadTask artworkUploadTask =
                                      imageRef.putFile(choosedImage!);
                                  await Future.wait([artworkUploadTask]);
                                  avatarDownloadUrl =
                                      await imageRef.getDownloadURL();
                                  print(avatarDownloadUrl);

                                  updatedData = {
                                    'artistName': nameController.text,
                                    'bio': bioController.text,
                                    'avatar': avatarDownloadUrl.toString(),
                                  };
                                } else {
                                  updatedData = {
                                    'artistName': nameController.text,
                                    'bio': bioController.text,
                                  };
                                }
                                await FirebaseHelper.artistCollection
                                    .doc(artistId)
                                    .update(updatedData)
                                    .whenComplete(
                                        () => Navigator.of(context).pop());

                                Map<String, dynamic> updatedArtistName = {
                                  'artistName': nameController.text
                                };

                                QuerySnapshot songsQuery = await FirebaseHelper
                                    .songCollection
                                    .where('artistId', isEqualTo: artistId)
                                    .get();

                                songsQuery.docs.forEach((songDoc) {
                                  songDoc.reference.update(
                                      {'artistName': nameController.text});
                                });

                                Fluttertoast.showToast(
                                    msg: "Update artist profile successfully!");

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
        ),
      ),
    );
  }
}
