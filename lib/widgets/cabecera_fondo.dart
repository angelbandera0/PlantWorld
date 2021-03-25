import 'dart:math';
import 'package:flutter/material.dart';

class FondoCabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final cajaRosa =
    Container(
      height: 360.0,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: LinearGradient(colors: [
            //Color.fromRGBO(236, 98, 188, 1.0),
            //Color.fromRGBO(241, 142, 172, 1.0),
            Colors.indigo,
            Colors.indigoAccent,
          ]),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(35, 37, 57, 1.0),
              blurRadius: 50.0,
            )
          ]),
    );

    return
        Positioned(
          top: -210.0,
          //left: -40,
          child: cajaRosa,
        );
  }
}
