import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/presentations/screens/artist/artist_page.dart';

class TestNav extends StatelessWidget {
  const TestNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test nav to Artist Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pass data to artist profile
            Get.toNamed("/artistPage",
                arguments: FirebaseAuth.instance.currentUser!.uid);
          },
          child: Text('Go to Artist Page'),
        ),
      ),
    );
  }
}
