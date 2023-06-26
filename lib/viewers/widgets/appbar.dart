import 'package:flutter/material.dart';

AppBar return_AppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF222222),
    centerTitle: true,
    title: Image.asset(
      "assets/images/logo.png",
      width: 48,
      height: 48,
    ),
  );
}
