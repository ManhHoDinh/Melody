import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melody/melody/core/models/firebase/instrument_request.dart';
import 'package:melody/melody/core/models/instrumentModel/instrumentModel.dart';

class CreateInstrumentScreen extends StatefulWidget {
  const CreateInstrumentScreen({super.key});

  @override
  State<CreateInstrumentScreen> createState() => _CreateInstrumentScreenState();
}

class _CreateInstrumentScreenState extends State<CreateInstrumentScreen> {
  final QuillController _controller = QuillController.basic();
  File? _image;
  final picker = ImagePicker();
  String imageUrl = "";
  TextEditingController nameController = TextEditingController();

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
    print("hoanganh");
    print(_image);
    if (_image == null) return;
    String uniqueName = DateTime.now().microsecondsSinceEpoch.toString();
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child("images");
    print(imageRef);
    final imageUploadRef = imageRef.child("${uniqueName}.jpg");
    try {
      UploadTask artworkUploadTask = imageRef.putFile(
          _image!,
          SettableMetadata(
            contentType: 'image/jpeg',
          ));
      await Future.wait([artworkUploadTask]);

      imageUrl = await imageUploadRef.getDownloadURL();
      print(imageUrl);
    } catch (e) {
      print("hii");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Instrument'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: nameController,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                    fillColor: ColorPalette.primaryColor,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter name of instrument',
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18),
              ),
              // QuillToolbar.simple(
              //   configurations: QuillSimpleToolbarConfigurations(
              //     controller: _controller,
              //     sharedConfigurations: const QuillSharedConfigurations(
              //       locale: Locale('vi'),
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 350,
              //   child: QuillEditor.basic(
              //     configurations: QuillEditorConfigurations(
              //       controller: _controller,
              //       sharedConfigurations: const QuillSharedConfigurations(
              //         locale: Locale('vi'),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: getImage,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20),
                    dashPattern: [4, 4],
                    color: Color(0xff9c9c9c),
                    strokeWidth: 2,
                    child: Card(
                      color: Color(0xffdcdcdc),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 160,
                        child: Center(
                            child: _image == null
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.cloud_upload),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Upload Instrument Image",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  )
                                : Image.file(
                                    _image!,
                                    height: 160,
                                  )),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please enter instrument name!");
                        return;
                      }

                      if (_image == null) {
                        Fluttertoast.showToast(
                            msg: "Please upload instrument image!");
                        return;
                      }
                      String id = FirebaseFirestore.instance
                          .collection('Instruments')
                          .doc()
                          .id;
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
                      InstrumentModel instrument = InstrumentModel(
                          name: nameController.value.text,
                          id: id,
                          description: jsonEncode(
                              _controller.document.toDelta().toJson()),
                          image: imageUrl);

                      FirebaseFirestore.instance
                          .collection('Instruments')
                          .doc(id)
                          .set(instrument.toJson());
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      child: Text('Create',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
