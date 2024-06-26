import 'package:flutter/material.dart';

class ColorPalette {
  static const Color backgroundColor = Color(0xffFFFFFF);
  static const Color primaryColor = Color(0xff198FB4);
  static const Color secondColor = Color(0xff0E9EEF);

  static const Color greenText = Color(0xff57CC99);
  static const Color darkBlueText = Color(0xff22577A);
  static const Color grayText = Color(0xffBFBFBF);
  static const Color blackText = Color(0xff000000);
  static const Color yellowColor = Color(0xffBFBFBF);
  static const Color orangeColor = Color(0xffBFBFBF);
  static const Color bgTextFieldColor = Color(0xffF5F6F9);

  static const Color calendarGround = Color(0xff002270);
  static const Color rankText = Color(0xff808080);
  static const Color infoDetail = Color(0xffA8D7D8);
  static const Color redColor = Color(0xb3E45826);
  static const Color detailBorder = Color(0xff9B9B9B);
  static const Color lateDay = Color(0xffF4E2BB);
  static const Color absentDay = Color(0xffE45826);

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
}

// Color(0xff+x) | Mã hex bỏ # ví dụ #123410 => Color(0xFF123410)
class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.darkBlueText,
      ColorPalette.primaryColor,
    ],
  );
}
