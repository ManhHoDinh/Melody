import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/image_helper.dart';

import '../../../core/helper/assets_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Image.asset(
          AssetHelper.splashImage,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ));
  }
}
