import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';

import '../../../../core/models/instrumentModel/instrumentModel.dart';

class InstrumentItem extends StatelessWidget {
  final InstrumentModel instrument;
  const InstrumentItem({super.key, required this.instrument});

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(instrument.image),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              instrument.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
