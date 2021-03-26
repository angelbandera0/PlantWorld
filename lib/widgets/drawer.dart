import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/screens/about/about.dart';
import 'package:myapp/screens/details/details.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/offline/offline_list_plants.dart';
import 'package:myapp/screens/settings.dart';
import 'package:myapp/screens/splash_page.dart';
import 'package:myapp/screens/terms/terms.dart';

class DrawerNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            child: Stack(
              children: [
                Positioned(
                  child: Image(
                    image: AssetImage("assets/img/icon.png"),
                    width: 200,
                    height: 200,
                    //placeholder: AssetImage("assets/img/logo.jpg"),
                  ),
                  left: -35,
                  bottom: -40,
                ),

              ],
            ),padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                //Color.fromRGBO(236, 98, 188, 1.0),
                //Color.fromRGBO(241, 142, 172, 1.0),
                Colors.teal,
                Colors.green,
              ]),
            )),
        ListTile(
          title: Text("About Us"),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.pop(context);
            Get.to(AboutUs(), transition: Transition.upToDown);
          },
        ),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
            Get.to(Home(), transition: Transition.upToDown);
          },
        ),
        ListTile(
          title: Text("Plants Consulted"),
          leading: Icon(Icons.storage),
          onTap: () {
            Navigator.pop(context);
            Get.to(OfflineListPlants(),
                transition: Transition.upToDown);
          },
        ),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);
            Get.to(()=>Settings(), transition: Transition.upToDown);
          },
        ),
        ListTile(
          title: Text("Terms of About"),
          leading: Icon(Icons.assignment),
          onTap: () {
            Navigator.pop(context);
            Get.to(Terms(), transition: Transition.upToDown);
          },
        ),
      ],
    );
  }
}
