import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/presentations/widgets/custom_textfield.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/presentations/widgets/custom_button.dart';
import 'package:path/path.dart' as path;

class ModifyAlbum extends StatefulWidget {
  ModifyAlbum({super.key, this.album});
  static const routeName = '/modifyAlbum';
  Album? album;
  @override
  State<ModifyAlbum> createState() => _ModifyAlbumState();
}

class _ModifyAlbumState extends State<ModifyAlbum> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final picker = ImagePicker();
  File? choosedImage;

  selectImage() async {
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
    super.initState();
    if (widget.album != null) {
      nameController.text = widget.album!.name;
      bioController.text = widget.album!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // add navigation to the previous page
            }, // add navigation to the previous page
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('A L B U M   I N F O'),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  maxLines: 1,
                  controller: nameController,
                  readOnly: false,
                  hintText: "Name your song",
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Bio",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Tap to change your avatar",
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
                          ? (widget.album != null
                              ? Image.network(
                                  widget.album!.image,
                                  height: 209,
                                  width: 209,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/defaultartwork.jpg",
                                  height: 209,
                                  width: 209,
                                ))
                          : Image.file(
                              File(choosedImage!.path),
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
    
                      final user = FirebaseAuth.instance.currentUser;
                      List<String> songIds = [];
                      if (widget.album != null) {
                        songIds = widget.album!.songIds;
                      }
    
                      if (user != null) {
                        try {
                          GlobalKey<State> _dialogKey = GlobalKey<State>();
                          AlertDialog alert = AlertDialog(
                            key: _dialogKey,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
    
                          Album album;
                          var docAlbum = await FirebaseFirestore.instance
                              .collection('Albums')
                              .doc();
                          if (widget.album != null) {
                            docAlbum = await FirebaseFirestore.instance
                                .collection('Albums')
                                .doc(widget.album!.id);
                          }
                          if (choosedImage != null) {
                            final imageFile =
                                path.basename(choosedImage!.path);
                            final imageRef = FirebaseStorage.instance
                                .ref()
                                .child("images/$imageFile");
                            UploadTask artworkUploadTask = imageRef.putFile(
                                choosedImage!,
                                SettableMetadata(
                                  contentType: 'image/jpeg',
                                ));
                            await Future.wait([artworkUploadTask]);
                            String imageUrl = await imageRef.getDownloadURL();
                            album = Album(
                              id: docAlbum.id,
                              artist_id: user.uid,
                              name: nameController.text,
                              songIds: songIds,
                              description: bioController.text,
                              image: imageUrl,
                            );
                          } else {
                            album = Album(
                                id: docAlbum.id,
                                artist_id: user.uid,
                                name: nameController.text,
                                description: bioController.text,
                                songIds: songIds,
                                image:
                                    "https://firebasestorage.googleapis.com/v0/b/melody-bf3aa.appspot.com/o/images%2Fdefaultartwork.jpg?alt=media&token=f2675568-8a2b-4a2f-9ebd-f342e8892c10");
                            if (widget.album != null) {
                              album = Album(
                                id: docAlbum.id,
                                artist_id: user.uid,
                                name: nameController.text,
                                description: bioController.text,
                                songIds: songIds,
                                image: widget.album!.image,
                              );
                            }
                          }
    
                          await docAlbum.set(album.toJson());
                          Navigator.of(context, rootNavigator: true)
                              .pop(_dialogKey.currentContext);
                          Fluttertoast.showToast(
                              msg: "Upload album profile successfully!");
                          Navigator.of(context).pop(album);
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
        ));
  }
}
