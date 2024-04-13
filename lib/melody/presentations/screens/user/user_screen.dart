import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pass userId to get to specific artist profile
            Get.toNamed("/artistPage",
                arguments: FirebaseAuth.instance.currentUser!.uid);
          },
          child: Text('Go to Artist Page'),
        ),
      ),
    );
  }
}
