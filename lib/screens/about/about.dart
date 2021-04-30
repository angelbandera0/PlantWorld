import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';
class AboutUs extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Color color=Colors.white;
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
                  SafeArea(child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 28,
                            color: color,
                          ),
                          onPressed: () =>Get.back(canPop: true)
                      ),
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
                  ),),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/img/icon.png"),
                            width: Get.height * 0.20,
                            height: Get.height * 0.20,
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
                          Expanded(
                            child: ListView(
                              children: [
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                    Text.rich(TextSpan(
                                      text: "",
                                      style: TextStyle(),
                                      children: [
                                        TextSpan(text: "Version: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        TextSpan(text: "1.0.0")]
                                    )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Work Team",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Management",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("MSc. Mabelkis Terry Rosabal",style: TextStyle(fontSize: 16),),
                                    Text("+53 55434334",style: TextStyle(fontSize: 16),),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Development & Desing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Angel Ernesto Hernández Bandera",style: TextStyle(fontSize: 16,),),
                                    Text("angelbandera0@gmail.com",style: TextStyle(fontSize: 16,),),
                                    Text("+53 58682295",style: TextStyle(fontSize: 16,),),

                                  ],
                                ),
                              ],
                            ),
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
