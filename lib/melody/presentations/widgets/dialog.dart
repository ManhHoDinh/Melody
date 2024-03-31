import 'package:flutter/material.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';

import '../../core/helper/text_styles.dart';

class DialogOverlay extends StatelessWidget {
  final bool isSuccess;
  final String task;
  final String? error;

  const DialogOverlay(
      {super.key, required this.isSuccess, required this.task, this.error});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset(
        isSuccess ? AssetHelper.checked : AssetHelper.checked,
        excludeFromSemantics: true,
        height: 120,
      ),
      backgroundColor: Colors.white.withOpacity(0),
      shadowColor: Colors.white.withOpacity(0),
      content: Text(
        isSuccess ? task + ' Successed!' : task + ' Failed!\n' + (error ?? ''),
        textAlign: TextAlign.center,
        style: TextStyles.h5.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}