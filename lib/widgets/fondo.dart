import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FondoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.5),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            //Color.fromRGBO(52, 54, 101, 1.0),
            //Color.fromRGBO(35, 37, 57, 1.0),
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor,
                //Colors.white,
          ])),
    );

    final cajaRosa =
        Container(
          height: size.height*0.31,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              //border: BorderDirectional(bottom: BorderSide(width: 3,)),
              gradient: LinearGradient(colors: [
                //Color.fromRGBO(236, 98, 188, 1.0),
                //Color.fromRGBO(241, 142, 172, 1.0),
                Theme.of(context).accentColor,
                Theme.of(context).primaryColor,

              ]),
             ),
        );
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -(Get.height*0.158),
          //left: -40,
          child: cajaRosa,
        )
      ],
    );
  }
}
