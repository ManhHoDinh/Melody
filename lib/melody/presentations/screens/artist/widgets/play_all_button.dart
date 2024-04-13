import 'package:flutter/material.dart';

class PlayAllButton extends StatelessWidget {
  const PlayAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "assets/images/playButton.png",
            height: 59,
            width: 59,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Play All",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
