import 'package:flutter/material.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/home_screen.dart';
import 'package:melody/melody/presentations/screens/account/login_screen.dart';
import 'package:melody/melody/presentations/screens/account/sign_up_screen.dart';
import 'package:melody/melody/presentations/screens/account/sign_up_screen.dart';
import 'package:melody/melody/presentations/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};

class Routes {
  static String allAlbum = '/allAlbum';
  static String allEvent = '/allEvent';
  static String createInstrument = '/createInstrument';
  static String discovery = '/discovery';
  static String uploadSong = '/uploadSong';
  static String artistPage = '/artistPage';
  static String editArtist = '/editArtist';
  static String playing = '/playing';
  static String queue = '/queue';
  static String editSong = '/editSong';
}
