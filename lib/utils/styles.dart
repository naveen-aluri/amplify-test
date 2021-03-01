import 'package:flutter/material.dart';

class Styles {
  static TextStyle regular({Color color, double fontSize = 14}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color);
  }

  static TextStyle bold(
      {Color color, double fontSize = 14, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: letterSpacing,
        color: color);
  }
}
