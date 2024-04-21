import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/AuthFunctions.dart';

class UserScreen extends StatefulWidget {
  AnimationController? animationController;
  UserScreen({super.key, required this.animationController});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Pass userId to get to specific artist profile
                Get.toNamed("/artistPage",
                    arguments: "0UBAPBKaLYeFRNvpywpHqPJLSlG2");
              },
              child: Text('Go to Artist Page'),
            ),
          ),
          AuthServices.CurrentUserIsManager()
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/createInstrument");
                    },
                    child: Text('Create Instrument'),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
