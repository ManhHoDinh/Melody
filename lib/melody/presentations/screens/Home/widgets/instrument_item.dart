import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';

import '../../../../core/models/instrumentModel/instrumentModel.dart';

class InstrumentItem extends StatelessWidget {
  final InstrumentModel instrument;
  const InstrumentItem({super.key, required this.instrument});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(instrument.image))),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              instrument.name,
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
