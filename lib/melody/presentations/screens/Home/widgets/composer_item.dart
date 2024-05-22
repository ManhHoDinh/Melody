import 'package:flutter/cupertino.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: 100,
          //   height: 100,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       image: DecorationImage(
          //           fit: BoxFit.cover, image: NetworkImage(composer.portrait))),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage("assets/images/default-avatar.jpg"),
              image: NetworkImage(composer.portrait),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              composer.composerName,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
