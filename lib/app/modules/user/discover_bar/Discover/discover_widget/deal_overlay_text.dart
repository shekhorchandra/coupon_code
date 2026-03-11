import 'package:flutter/material.dart';

Widget dealOverlayText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          blurRadius: 4,
          color: Colors.black45,
          offset: Offset(0, 1),
        ),
      ],
    ),
  );
}
