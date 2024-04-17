import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final controller;
  final bool readOnly;
  final String hintText;
  final int maxLines;

  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.readOnly,
      required this.hintText,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      enabled: !readOnly,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
              fontWeight: FontWeight.w700),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(15)),
          filled: true,
          contentPadding: EdgeInsets.all(16)),
    );
  }
}
