import 'package:flutter/material.dart';

class Styles {
  static TextStyle regular({Color color}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color);
  }

  static TextStyle bold({Color color}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color);
  }
}
