import 'package:flutter/material.dart';

class SpordleBorders {
  static primaryStrokeBorder(Color color) {
    return Border.all(
        color: color,
        width: 3,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside);
  }

  static const tiltBorders = BorderRadius.only(
    topLeft: Radius.zero,
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.zero,
  );
}
