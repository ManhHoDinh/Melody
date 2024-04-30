import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';

class PerfomerItem extends StatelessWidget {
  final Perfomer perfomer;
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
                  image: AssetImage(perfomer.image),
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
              perfomer.name,
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
