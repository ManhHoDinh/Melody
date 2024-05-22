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
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/core/models/firebase/event_request.dart';
import 'package:melody/melody/presentations/screens/artist/widgets/custom_button.dart';
import 'package:melody/melody/presentations/screens/event/widgets/custom_textfield.dart';
import 'package:melody/melody/presentations/screens/event/widgets/custom_timefield.dart';
import 'package:path/path.dart' as path;

class AddEventSrceen extends StatefulWidget {
  const AddEventSrceen({super.key});

  @override
  State<AddEventSrceen> createState() => _AddEventSrceenState();
}

class _AddEventSrceenState extends State<AddEventSrceen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  // String? artistId = Get.arguments;
  // // File? choosedImage;
  // String? avatarDownloadUrl;
  File? choosedImage;
  String? avatarDownloadUrl;
  String id = FirebaseHelper.eventCollection.doc().id;
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
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();


    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images/$fileName");

 
    UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.whenComplete(() {});
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
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
          title: Text('Create Event'),
        ),
        // body: FutureBuilder<Artist>(
        //   future: ArtistRequest.getById(artistId!),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //           child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           CircularProgressIndicator(),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Text("Loading")
        //         ],
        //       ));
        //     } else if (snapshot.hasError) {
        //       return Center(
        //         child: Text('Error loading artist information'),
        //       );
        //     } else {
        // nameController.text = snapshot.data!.artistName;
        // bioController.text = snapshot.data!.bio;
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        : null,
                  ),
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
              // GestureDetector(
              //   onTap: selectImage,
              //   child: Center(
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(8),
              //       child: choosedImage == null
              //           ? Image.network(
              //               snapshot.data!.avatar,
              //               height: 209,
              //               width: 209,
              //             )
              //           : Image.file(
              //               File(choosedImage!.path!),
              //               width: 209,
              //               height: 209,
              //               fit: BoxFit.cover,
              //             ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 31,
              ),
              // FutureBuilder<Event>(
              //     future: mAuth.currentUser != null
              //         ? EventRequest.getById(mAuth.currentUser!.uid)
              //         : null,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState ==
              //           ConnectionState.waiting) {
              //         return CustomButton(
              //           onClick: () {},
              //           bgColor: Color(0xff262626),
              //           text: "Add Event",
              //           textColor: Colors.white,
              //         );
              //       } else if (snapshot.hasError) {
              //         return Text('Error: ${snapshot.error}');
              //       } else {
              //         return
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
                          msg: "Please fill all the fields!");
                      return;
                    }
                    // rest of your code

                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Adding Event",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          );
                        });

          
                    try {
                      DateFormat inputFormat =
                          DateFormat("MMMM d, yyyy 'at' h:mm:ss a 'UTC+7'");

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
                      DateTime parsedEndDate = inputFormat.parse(inputEndDate);
                      avatarDownloadUrl =
                          await uploadImageToFirebase(choosedImage!);
                      String formattedStartDate =
                          DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(parsedStartDate);
                      String formattedEndDate =
                          DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(parsedEndDate);
                      Map<String, dynamic> eventData;
                      if (choosedImage != null) {
                        Event event = Event(
                          name: nameController.text,
                          description: desController.text,
                          location: locationController.text,
                          image: avatarDownloadUrl.toString(),
                          startAt: formattedStartDate,
                          endAt: formattedEndDate,
                          id: id,
                        );
                        try {
                          FirebaseHelper.eventCollection
                              .doc(id)
                              .set(event.toJson())
                              .whenComplete(() => Navigator.of(context).pop());
                          Fluttertoast.showToast(
                              msg: "Comment added successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } catch (e) {
                          print('Failed to add comment: $e');
                        }
                        // final imageFile = path.basename(choosedImage!.path);
                        // final imageRef = FirebaseStorage.instance
                        //     .ref()
                        //     .child("images/$imageFile");
                        // UploadTask eventImageUploadTask =
                        //     imageRef.putFile(choosedImage!);
                        // await Future.wait([eventImageUploadTask]);
                        // avatarDownloadUrl = await imageRef.getDownloadURL();
                        // print(avatarDownloadUrl);

                        // eventData = {
                        //   'name': nameController.text,
                        //   'description': desController.text,
                        //   'location': locationController.text,
                        //   'image': avatarDownloadUrl.toString(),
                        //   'startAt': Timestamp.fromDate(DateTime.parse(
                        //       startDateController.text +
                        //           " " +
                        //           startTimeController.text)),
                        //   'endAt': Timestamp.fromDate(DateTime.parse(
                        //       endDateController.text +
                        //           " " +
                        //           endTimeController.text)),
                        // };
                      }
                      // else {
                      //   eventData = {
                      //     'name': nameController.text,
                      //     'description': desController.text,
                      //     'location': locationController.text,
                      //     'startAt': Timestamp.fromDate(DateTime.parse(
                      //         startDateController.text +
                      //             " " +
                      //             startTimeController.text)),
                      //     'endAt': Timestamp.fromDate(DateTime.parse(
                      //         endDateController.text +
                      //             " " +
                      //             endTimeController.text)),
                      //   };
                      // }
                      // final newEventRef =
                      //     await FirebaseHelper.eventCollection.add(eventData);
                      // final id = newEventRef.id;
                      // await FirebaseHelper.eventCollection
                      //     .add(eventData)
                      //     .whenComplete(() => Navigator.of(context).pop());

                      Fluttertoast.showToast(msg: "Event added successfully!");

                      Get.back();
                    } catch (e) {
                      print(e);
                    }
                    // } else {
                    //   print("User's not signed in");
                    // }
                  } catch (e) {
                    print(e);
                  }
                },
                bgColor: Color(0xff262626),
                text: "Add Event",
                textColor: Colors.white,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
