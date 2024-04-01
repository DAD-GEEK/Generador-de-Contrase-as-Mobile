import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(title) {
  return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.red.shade400,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: "Madimi One",
        fontSize: 35,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
      ));
}
