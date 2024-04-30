import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/upload.png",
            width: 31,
            height: 31,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Upload",
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
