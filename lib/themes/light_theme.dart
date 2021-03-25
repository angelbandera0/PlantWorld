import 'package:flutter/material.dart';

import 'colors.dart';

final themeLight = ThemeData(
  fontFamily: 'OpenSans',
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),
  textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black45),
      subtitle1: TextStyle(color: Colors.black26)),
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: GFColors.WHITE,
  focusColor:Color(0xFFe8dde1),
  primaryColor: Colors.green,
  accentColor: Colors.teal,
  backgroundColor: Color(0xFFe8dde1),
);
