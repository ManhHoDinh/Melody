import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/instrument/instrument.dart';
import 'package:melody/melody/core/models/music/music.dart';

class InstrumentItem extends StatelessWidget {
  final Instrument instrument;
  const InstrumentItem({super.key, required this.instrument});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(instrument.image))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              instrument.name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
