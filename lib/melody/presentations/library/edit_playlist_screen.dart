import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/presentations/widgets/appbar_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

class EditPlaylistScreen extends StatefulWidget {
  const EditPlaylistScreen({super.key});

  @override
  State<EditPlaylistScreen> createState() => _EditPlaylistScreenState();
}

class _EditPlaylistScreenState extends State<EditPlaylistScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String id = Get.arguments;
  File? _image;
  final picker = ImagePicker();
  String imageUrl = "";
  Future<void> setPlaylistData() async {
    Playlist playlist = await PlaylistRequest.getById(id);
    setState(() {
      nameController.text = playlist.name;
      descriptionController.text = playlist.description;
      imageUrl = playlist.image;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPlaylistData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        'Edit Playlist',
      ),
      body: FutureBuilder<Playlist>(
          future: PlaylistRequest.getById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff9c9c9c)),
                          fillColor: Color(0xffe0e0e0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter playlist name...',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextField(
                        maxLines: null,
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                        controller: descriptionController,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff9c9c9c)),
                          fillColor: Color(0xffe0e0e0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter playlist description...',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Cover',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Tap to change playlist cover'),
                      ),
                      GestureDetector(
                        onTap: getImage,
                        child: Center(
                          child: _image == null
                              ? Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              snapshot.data!.image))))
                              : Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(_image!)))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (nameController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter playlist name!");
                                return;
                              }
                              if (descriptionController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter playlist description!");
                                return;
                              }

                              if (_image == null) {
                                Fluttertoast.showToast(
                                    msg: "Please upload playlist image!");
                                return;
                              }
                              final imageFile = path.basename(_image!.path);
                              final imageRef = FirebaseStorage.instance
                                  .ref()
                                  .child("images/$imageFile");
                              UploadTask artworkUploadTask = imageRef.putFile(
                                  _image!,
                                  SettableMetadata(
                                    contentType: 'image/jpeg',
                                  ));
                              await Future.wait([artworkUploadTask]);
                              String imageUrl = await imageRef.getDownloadURL();
                              var playlist =
                                  FirebaseHelper.playlistCollection.doc(id);
                              Map<String, dynamic> data = {
                                "name": nameController.value.text,
                                "description": descriptionController.value.text,
                                "image": imageUrl
                              };
                              playlist.update(data).then((value) {
                                print('Document updated successfully');
                              }).catchError((error) {
                                print('Failed to update document: $error');
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPalette.primaryColor),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              width: double.infinity,
                              child: Text('Save Changes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }

  Future getImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'jpg',
      'png',
      'jpeg',
      'webp',
    ]);
    if (result == null) return;

    setState(() {
      _image = File(result.files.single.path!);
    });
  }

  Future<void> uploadImageToFirebase() async {
    print(_image);
    if (_image == null) return;
    String uniqueName = DateTime.now().microsecondsSinceEpoch.toString();
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child("images");
    final imageUploadRef = imageRef.child("${uniqueName}.jpg");
    try {
      await imageUploadRef.putFile(File(_image!.path));
      imageUrl = await imageUploadRef.getDownloadURL();
      print(imageUrl);
    } catch (e) {
      print(e);
    }
  }
}
