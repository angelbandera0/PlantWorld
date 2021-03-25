import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Encabezado extends StatelessWidget {
  final String h1;
  final String h2;
  Encabezado({this.h1, this.h2});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.fromLTRB(20,20,20,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
      /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        InkWell(
          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            child: FaIcon(FontAwesomeIcons.angleLeft,size: 40,color: Colors.white,),
            onTap: () { print("Pressed"); }
        ),InkWell(
          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            child: FaIcon(FontAwesomeIcons.infoCircle,size: 30,color: Colors.white,),
            onTap: () { print("Pressed"); }
        ),
      ],),*/

          Text(
            h1,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            h2,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    ));
  }
}
