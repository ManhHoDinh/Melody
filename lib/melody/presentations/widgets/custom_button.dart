import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final onClick;
  final Color bgColor;
  final String text;
  final Color textColor;
  CustomButton(
      {super.key,
      required this.onClick,
      required this.bgColor,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
