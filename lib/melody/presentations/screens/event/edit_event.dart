import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/event_request.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/custom_button.dart';
import 'package:melody/melody/presentations/screens/event/widgets/custom_textfield.dart';
import 'package:melody/melody/presentations/screens/event/widgets/custom_timefield.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class EditEventSrceen extends StatefulWidget {
  final String id;
  const EditEventSrceen({Key? key, required this.id}) : super(key: key);

  @override
  State<EditEventSrceen> createState() => _EditEventSrceenState();
}

class _EditEventSrceenState extends State<EditEventSrceen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();
  @override
  FirebaseAuth mAuth = FirebaseAuth.instance;
  // String? artistId = Get.arguments;
  // // File? choosedImage;
  // String? avatarDownloadUrl;
  File? choosedImage;
  String? avatarDownloadUrl;

  @override
  Future selectImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [
      'jpg',
      'png',
      'jpeg',
      'webp',
    ]);
    if (result != null && result.files.single.path != null) {
      setState(() {
        choosedImage = File(result.files.single.path!);
      
      });
    } else {
      Fluttertoast.showToast(msg: "No file selected");
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("images/$fileName");
      UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() {});
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image to Firebase: $e");
      throw Exception("Failed to upload image to Firebase");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Event ID: ${widget.id}');
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, // add navigation to the previous page
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Edit Event'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Events')
            .doc(widget.id)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data?.data() as Map<String, dynamic>?;
            DateFormat firebaseDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

            if (data != null) {
              nameController.text = data['name'] ?? '';
              desController.text = data['description'] ?? '';
              locationController.text = data['location'] ?? '';
              if (data['startAt'] != null) {
                DateTime startAt = firebaseDateFormat.parse(data['startAt']);
                startDateController.text =
                    DateFormat('MMMM dd, yyyy').format(startAt);
                startTimeController.text =
                    DateFormat('HH:mm:ss').format(startAt);
              }
              if (data['startAt'] != null) {
                DateTime endAt = firebaseDateFormat.parse(data['endAt']);
                endDateController.text =
                    DateFormat('MMMM dd, yyyy').format(endAt);
                endTimeController.text = DateFormat('HH:mm:ss').format(endAt);
              }
          
            }
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
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        maxLines: 1,
                        controller: nameController,
                        readOnly: false,
                        hintText: "Event Name",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        maxLines: 3,
                        controller: desController,
                        readOnly: false,
                        hintText: "Event description.",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      CustomTimefield(
                        title: 'Event Day and Time',
                        initialDate: DateTime.parse("2024-04-13"),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                        startDateController: startDateController,
                        startTimeController: startTimeController,
                        endDateController: endDateController,
                        endTimeController: endTimeController,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      CustomTextfield(
                        maxLines: 1,
                        controller: locationController,
                        readOnly: false,
                        hintText: "Add Location",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      GestureDetector(
                        onTap: selectImage,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff95C8D7),
                              borderRadius: BorderRadius.circular(8),
                              image: choosedImage != null
                                  ? DecorationImage(
                                      image: FileImage(choosedImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(data?['image'] ?? ''),
                                      fit: BoxFit.cover,
                                    )),
                          child: Center(
                            child: choosedImage == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Upload event image',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 31,
                      ),
                      CustomButton(
                        onClick: () async {
                          try {
                            if (nameController.text.trim().isEmpty ||
                                desController.text.trim().isEmpty ||
                                locationController.text.trim().isEmpty ||
                                startDateController.text.trim().isEmpty ||
                                startTimeController.text.trim().isEmpty ||
                                endDateController.text.trim().isEmpty ||
                                endTimeController.text.trim().isEmpty) {
                              Fluttertoast.showToast(
                                msg: "Please fill all the fields!",
                              );
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
                                        "Updating Event",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );

                            DateFormat inputFormat = DateFormat(
                                "MMMM d, yyyy 'at' h:mm:ss a 'UTC+7'");

                            String inputStartDate = startDateController.text +
                                " at " +
                                startTimeController.text +
                                " PM UTC+7";
                            DateTime parsedStartDate =
                                inputFormat.parse(inputStartDate);

                            String inputEndDate = endDateController.text +
                                " at " +
                                endTimeController.text +
                                " PM UTC+7";
                            DateTime parsedEndDate =
                                inputFormat.parse(inputEndDate);
                            avatarDownloadUrl =
                                await uploadImageToFirebase(choosedImage!);
                            String formattedStartDate =
                                DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(parsedStartDate);
                            String formattedEndDate =
                                DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(parsedEndDate);

                            Map<String, dynamic> updateEvent = {
                              'name': nameController.text,
                              'description': desController.text,
                              'location': locationController.text,
                              'image': avatarDownloadUrl.toString(),
                              'startAt': formattedStartDate,
                              'endAt': formattedEndDate,
                              'id': widget.id,
                            };

                            try {
                              await FirebaseHelper.eventCollection
                                  .doc(widget.id)
                                  .update(updateEvent);
                              Navigator.of(context).pop();
                              Fluttertoast.showToast(
                                msg: "Event updated successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Get.back();
                            } catch (e) {
                              print('Failed to update Event: $e');
                              Fluttertoast.showToast(
                                msg: "Failed to update Event",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          } catch (e) {
                            print('Error updating event: $e');
                            Fluttertoast.showToast(
                              msg: "Error updating event",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        bgColor: Color(0xff262626),
                        text: "Update Event",
                        textColor: Colors.white,
                      )
                    ]),
              ),
            );
          } else {
            return Text('No data');
          }
        },
      ),
    ));
  }
}
