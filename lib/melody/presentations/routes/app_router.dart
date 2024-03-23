import 'package:flutter/material.dart';
import 'package:melody/melody/presentations/screens/Home/home_screen.dart';
import 'package:melody/melody/presentations/screens/account/login_screen.dart';
import 'package:melody/melody/presentations/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
};

class Routes {
  static String playing = '/playing';
  static String queue = '/queue';
}
