import 'package:flutter/material.dart';

final themeDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'OpenSans',
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),
  scaffoldBackgroundColor: Colors.black45,
  textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white54)),
  dialogBackgroundColor: Color(0xff393939),
  inputDecorationTheme: InputDecorationTheme(fillColor: Color(0xff393939)),
  //scaffoldBackgroundColor: Color(0xFFe8dde1),
  focusColor: Color(0xFFe8dde1),
  primaryColor: Colors.green,
  accentColor: Colors.teal,
  //backgroundColor: Colors.black26,
);
