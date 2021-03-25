import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class NavBar extends StatelessWidget {
   final GlobalKey<ScaffoldState> scaffoldState;
   final String title;
   final bool startPage;
   NavBar({@required this.scaffoldState,this.title,this.startPage});
   @override
   Widget build(BuildContext context) {
     Color color=Colors.white;
     return  Container(
       //color: Colors.green,
         child: Container(
           margin: EdgeInsets.fromLTRB(10, 25, 10, 0),

           //color: Colors.blue,

           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               (startPage)?
               IconButton(
                   icon: Icon(
                     Icons.dehaze,
                     size: 28,
                     color: color,
                   ),
                   onPressed: () =>
                       scaffoldState.currentState.openDrawer()):IconButton(
                   icon: Icon(
                     Icons.arrow_back_ios,
                     size: 28,
                     color: color,
                   ),
                   onPressed: () =>Get.back(canPop: true)
               ),
               Text(title,style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: color,
                   fontSize: 25),),
               (startPage)?IconButton(
                   icon: Icon(
                     Icons.info_outline,
                     size: 28,
                     color: color,
                   ),
                   onPressed: null):IconButton(
                   icon: Icon(
                     Icons.dehaze,
                     size: 28,
                     color: color,
                   ),
                   onPressed: () =>
                       scaffoldState.currentState.openDrawer()),
             ],
           ),
         ),
         decoration: BoxDecoration(
           //boxShadow: [BoxShadow(color: Colors.black45,spreadRadius: 2,blurRadius: 3)],
           gradient: LinearGradient(colors: [
             Colors.teal,
             Colors.green,
           ]),)
     );
   }
 }
