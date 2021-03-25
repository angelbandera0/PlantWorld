import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  final Color color;
  final IconData icono;
  final String texto;
  final String ruta;
  Option({this.color, this.icono, this.texto,this.ruta});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OptionState(color: color, icono: icono, texto: texto,ruta:ruta);
  }
}

class OptionState extends State<Option> {
  final Color color;
  final IconData icono;
  final String texto;
  final String ruta;
  OptionState({this.color, this.icono, this.texto,this.ruta});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      splashColor: Colors.indigo,
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
      child: Card(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),color: Color.fromRGBO(0, 0, 0, 0),
        elevation: 8,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
        height: 80.0,
        //margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              //Color.fromRGBO(62, 66, 107, 0.7),
              //Color.fromRGBO(62, 66, 135, 0.7),
              Colors.white,Colors.white
            ]),
            borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 10.0),
            CircleAvatar(

              backgroundColor: color,
              radius: 30.0,
              child: Icon(icono, color: Colors.white, size: 30.0),
            ),
            SizedBox(width: 20.0),
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),

                Text(
                  texto,
                  style: TextStyle( fontSize: 18.0),
                ),
                //SizedBox( height: 10.0 ),
                //Text( texto , style:GoogleFonts.lato(textStyle:TextStyle( color: Colors.white,)), ),
              ],
            ),
          ],
        ),
      ),)
    );
  }
}
