import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';

class Terms extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          Get.put(HomeController());

          return Scaffold(
            key: _scaffoldState,
            /* appBar: PreferredSize(
              child: NavBar(
                scaffoldState: _scaffoldState,
                title: "About Us",
                startPage: false,
              ),
              preferredSize: Size(Get.width, 100),
            ),*/
            body: Stack(
              children: [
                FondoApp(),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 28,
                              color: color,
                            ),
                            onPressed: () => Get.back(canPop: true)),
                        IconButton(
                            icon: Icon(
                              Icons.dehaze,
                              size: 28,
                              color: color,
                            ),
                            onPressed: () =>
                                _scaffoldState.currentState.openDrawer())
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/img/icon.png"),
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          "Plant World",
                          style: TextStyle(
                              fontSize: 55,
                              fontFamily: "EarthHeart",
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                            TextSpan(text: "", style: TextStyle(), children: [
                          TextSpan(
                            text: "Version: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "1.0.0")
                        ])),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Terms of About",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "With this application we do not seek any kind of profit or enrichment. We offer our services completely free of charge in order to help all those people who are looking for information related to the subject of plants and their characteristics. We heartily appreciate any kind of help or contribution.",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height:10
                        ),
                        Text(
                          "We reject any enrichment activity through this application; as well as everything that attempts against the proper functioning of the app or tries to illegally modify the code or endanger the integrity, privacy and security of our users.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: DrawerNav(),
            ),
          );
        });
  }
}
