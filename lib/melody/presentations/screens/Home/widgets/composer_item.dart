import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';

class ComposerItem extends StatelessWidget {
  
  final Composer composer;
  const ComposerItem({super.key, required this.composer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: AssetImage(composer.image))),
            ),
          ),
          Text(
            composer.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
          ),
          Text(
            composer.music,
            style: TextStyle(fontSize: 12, color: Color(0xffe7e7e9)),
          ),
        ],
      ),
    );
  }
}