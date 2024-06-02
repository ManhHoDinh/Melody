import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';

import '../../../../core/models/artist/artist.dart';

class PerfomerItem extends StatelessWidget {
  final Artist perfomer;
  const PerfomerItem.PerformerItem({super.key, required this.perfomer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(perfomer.avatar),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              perfomer.artistName,
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
