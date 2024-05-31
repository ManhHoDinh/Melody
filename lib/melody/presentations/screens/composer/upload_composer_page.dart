import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:path/path.dart' as path;

class UploadComposerPage extends StatefulWidget {
  const UploadComposerPage({super.key});

  @override
  State<UploadComposerPage> createState() => _UploadComposerPageState();
}

class _UploadComposerPageState extends State<UploadComposerPage> {
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
              title: Text('U P L O A D'),
              centerTitle: true,
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
                      hintText: "Composer name",
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
                              ? Image.asset(
                                  "assets/images/default-avatar.jpg",
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
                          if (choosedImage == null) {
                            Fluttertoast.showToast(
                                msg:
                                    "Please choose a portrait for your composer!");
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

                          final user = FirebaseAuth.instance.currentUser!.uid;
                          if (user != null) {
                            try {
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

                              String composerId =
                                  FirebaseHelper.composerCollection.doc().id;

                              Composer newComposer = Composer(
                                composerId: composerId,
                                composerName: nameController.text,
                                about: aboutController.text,
                                portrait: portraitDownloadUrl !=
                                        null // default artwork if user didn't choose an image)
                                    ? portraitDownloadUrl.toString()
                                    : "https://firebasestorage.googleapis.com/v0/b/melody-bf3aa.appspot.com/o/images%2Fdefault-avatar.jpg?alt=media&token=2f50a923-90ec-4666-95c7-5fad6f38afef",
                              );

                              FirebaseHelper.composerCollection
                                  .doc(composerId)
                                  .set(newComposer.toJson())
                                  .whenComplete(
                                      () => Navigator.of(context).pop());

                              Fluttertoast.showToast(
                                  msg: "Upload composer successfully!");

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
                      text: "Upload Composer",
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            )));
  }
}
