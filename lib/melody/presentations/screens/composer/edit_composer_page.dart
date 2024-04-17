import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/firebase/composer_request.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:path/path.dart' as path;

class EditComposer extends StatefulWidget {
  const EditComposer({super.key});

  @override
  State<EditComposer> createState() => _EditComposerState();
}

class _EditComposerState extends State<EditComposer> {
  String composerId = Get.arguments;
  final nameController = TextEditingController();
  final aboutController = TextEditingController();
  File? choosedImage;
  String? portraitDownloadUrl;

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
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: Text('C O M P O S E R   I N F O'),
      ),
      body: FutureBuilder<Composer>(
        future: ComposerRequest.getById(composerId),
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
            Composer composer = snapshot.data!;
            nameController.text = composer.composerName;
            aboutController.text = composer.about;

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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      maxLines: 1,
                      controller: nameController,
                      readOnly: false,
                      hintText: "Enter your composer name",
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "About",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      maxLines: 5,
                      controller: aboutController,
                      readOnly: false,
                      hintText: "Write something about the composer",
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Portrait",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Tap to select a portrait of the composer",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                                  snapshot.data!.portrait,
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
                                msg: "Please enter your composer name!");
                            return;
                          }

                          if (aboutController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg:
                                    "Please write something about your composer!");
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
                                        "Updating",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                );
                              });

                          final user = FirebaseAuth.instance.currentUser!.uid;
                          if (user != null) {
                            Map<String, dynamic> updatedData;
                            try {
                              if (choosedImage != null) {
                                final imageFile =
                                    path.basename(choosedImage!.path);
                                final imageRef = FirebaseStorage.instance
                                    .ref()
                                    .child("images/$imageFile");
                                UploadTask portraitUploadTask =
                                    imageRef.putFile(choosedImage!);
                                await Future.wait([portraitUploadTask]);
                                portraitDownloadUrl =
                                    await imageRef.getDownloadURL();
                                print(portraitDownloadUrl);

                                updatedData = {
                                  'composerName': nameController.text,
                                  'about': aboutController.text,
                                  'portrait': portraitDownloadUrl.toString(),
                                };
                              } else {
                                updatedData = {
                                  'composerName': nameController.text,
                                  'about': aboutController.text,
                                };
                              }
                              await FirebaseHelper.composerCollection
                                  .doc(composerId)
                                  .update(updatedData)
                                  .whenComplete(
                                      () => Navigator.of(context).pop());

                              Map<String, dynamic> updatedComposerName = {
                                'artistName': nameController.text
                              };

                              QuerySnapshot songsQuery = await FirebaseHelper
                                  .songCollection
                                  .where('artistId', isEqualTo: composerId)
                                  .get();

                              songsQuery.docs.forEach((songDoc) {
                                songDoc.reference.update(
                                    {'artistName': nameController.text});
                              });

                              Fluttertoast.showToast(
                                  msg:
                                      "Update composer information successfully!");

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
                      text: "Udate Composer",
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    ));
  }
}
