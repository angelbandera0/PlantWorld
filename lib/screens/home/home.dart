import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/providers/plant_provider.dart';
import 'package:myapp/screens/home/localWidgets/search_input.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';

import 'localWidgets/card_img_home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final PlantProvider kp = PlantProvider();
  final bool c = Get.isDarkMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(Get.height*0.07325);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            key: _scaffoldState,
            appBar: PreferredSize(
              child: NavBar(
                scaffoldState: _scaffoldState,
                title: "",
                startPage: true,
              ),
              preferredSize: Size(Get.width, 100),
            ),
            body: DoubleBackToCloseApp(
              child: Stack(
                children: [
                  FondoApp(),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, Get.height * 0.03, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/img/icon.png"),
                          width: Get.height * 0.20,
                          height: Get.height * 0.20,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Plant World",
                                    style: TextStyle(
                                        fontSize: Get.height*0.07325,
                                        fontFamily: "EarthHeart",
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SearchInput(),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Browse and contribute to the Trefle botanical data.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Last Plants Visited",
                                    style: TextStyle(
                                      fontSize: 20,color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  FutureBuilder(
                                      future: Hive.openBox("species"),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<Box<dynamic>> snapshot) {
                                        if (snapshot.hasData) {
                                          if(snapshot.data.values.toList().length != 0) {
                                            List<dynamic> lsoh = snapshot.data.values
                                                .toList();
                                            lsoh.sort((a, b) {
                                              return b.date.compareTo(a.date);
                                            });
                                            print(min(4, lsoh.length));

                                            return Container(
                                                child: CarouselSlider(
                                                  options: CarouselOptions(
                                                    autoPlay: true,
                                                    aspectRatio: 2.0,
                                                    enlargeCenterPage: true,
                                                  ),
                                                  items:
                                                  lsoh.getRange(
                                                      0, min(4, lsoh.length))
                                                      .toList()
                                                      .map((i) {
                                                    return Builder(
                                                      builder: (
                                                          BuildContext context) {
                                                        return CardImgHome(
                                                            i);
                                                      },
                                                    );
                                                  }).toList(),
                                                )
                                            );
                                          }
                                          else{
                                            return  Container(
                                              child:Column(
                                                children: <Widget>[
                                                  SizedBox(height: Get.height * 0.03,),
                                                  Icon(Icons.terrain,size: 90,),
                                                  Text("No has data.",style: TextStyle(fontSize: 16)),
                                                ],
                                              ),
                                            );
                                          }
                                        }
                                        else {
                                          return Center(
                                              child: CircularProgressIndicator());
                                        }
                                      })

                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),


                ],
              ),
              snackBar: SnackBar(
                margin: EdgeInsets.all(20),
                content: Text('Tap back again to leave',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                behavior: SnackBarBehavior.floating,
              ),
            ),
            drawer: Drawer(
              child: DrawerNav(),
            ),
          );
        });
  }
}
