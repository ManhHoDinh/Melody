import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melody/melody/presentations/screens/account/login_screen.dart';

import '../../../core/helper/AuthFunctions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.animationController});
  static final String routeName = 'home_screen';
  final AnimationController? animationController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children:[ 
              appBar(),
              Expanded(
                child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        final GoogleSignIn googleSignIn = GoogleSignIn();
              
                        await googleSignIn.signOut();
              
                        AuthServices.CurrentUser = null;
              
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      child: Text('Go to Login Screen'),
                    ),
              )
        
        ]),
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Container(
                  width: AppBar().preferredSize.height - 8,
                  height: AppBar().preferredSize.height - 8,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Home Screen',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Container(
                  width: AppBar().preferredSize.height - 8,
                  height: AppBar().preferredSize.height - 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                      child: Icon(
                        multiple ? Icons.dashboard : Icons.view_agenda,
                        color: Colors.black,
                      ),
                      onTap: () {
                        setState(() {
                          multiple = !multiple;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
