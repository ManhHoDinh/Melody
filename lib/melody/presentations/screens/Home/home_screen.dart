import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melody/melody/presentations/screens/account/login_screen.dart';

import '../../../core/helper/AuthFunctions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
          child: GestureDetector(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          final GoogleSignIn googleSignIn = GoogleSignIn();

          await googleSignIn.signOut();

          AuthServices.CurrentUser = null;

          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
        child: Text('Go to Login Screen'),
      )),
    );
  }
}
