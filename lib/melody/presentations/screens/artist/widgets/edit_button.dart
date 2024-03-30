import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/edit.png",
            width: 31,
            height: 31,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Edit",
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
