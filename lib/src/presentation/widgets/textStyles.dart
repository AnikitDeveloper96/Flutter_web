import 'package:flutter/material.dart';

TextStyle commonTextStyles(
    Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontStyle: FontStyle.normal,
    fontWeight: fontWeight,
  );
}
