import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:melody/melody/core/models/firebase/instrument_request.dart';
import 'package:melody/melody/core/models/instrument/instrument.dart';

class CreateInstrumentScreen extends StatefulWidget {
  const CreateInstrumentScreen({super.key});

  @override
  State<CreateInstrumentScreen> createState() => _CreateInstrumentScreenState();
}

class _CreateInstrumentScreenState extends State<CreateInstrumentScreen> {
  var _controller = QuillController.basic();
  File? _image;
  final picker = ImagePicker();
  String imageUrl = "";
  TextEditingController nameController = TextEditingController();

  Future getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
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
                    fillColor: Color(0xff9c9c9c),
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
              //       locale: Locale('de'),
              //     ),
              //   ),
              // ),
              Container(
                height: 350,
                // child: QuillEditor.basic(
                //   configurations: QuillEditorConfigurations(
                //     controller: _controller,
                //     readOnly: false,
                //     sharedConfigurations: const QuillSharedConfigurations(
                //       locale: Locale('de'),
                //     ),
                //   ),
                // ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await getImage();
                  await uploadImageToFirebase();
                },
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
                      String id = FirebaseFirestore.instance
                          .collection('Instruments')
                          .doc()
                          .id;
                      Instrument instrument = Instrument(
                          name: nameController.value.text,
                          id: id,
                          description: jsonEncode(
                              _controller.document.toDelta().toJson()),
                          image: imageUrl);

                      FirebaseFirestore.instance
                          .collection('Instruments')
                          .doc(id)
                          .set(instrument.toJson());
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
