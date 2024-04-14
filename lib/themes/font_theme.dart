import 'package:flutter/material.dart';

class detailsScreen {
  static TextStyle detailsLabel(){
  FontWeight fontWeight = FontWeight.w500;
  double fontSize = 16;
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: Colors.grey
  );
  }

  static TextStyle details(){
    double fontSize = 16;
    return TextStyle(
    fontSize: fontSize,
    color: Colors.black
  );
  }
}