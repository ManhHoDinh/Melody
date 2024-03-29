import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar AppbarWidget(String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back,
        size: 30,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 24),
    ),
  );
}
