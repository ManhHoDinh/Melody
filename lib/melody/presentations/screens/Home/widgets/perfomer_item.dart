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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              width: 80,
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
          Align(
            alignment: Alignment.center,
            child: Text(
              perfomer.name,
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
