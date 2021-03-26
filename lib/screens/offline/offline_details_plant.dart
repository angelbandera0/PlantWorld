import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/screens/offline/localWidgets/growingOffline.dart';
import 'package:myapp/screens/offline/localWidgets/soilOffline.dart';
import 'package:myapp/screens/offline/localWidgets/specificationsOffline.dart';
import 'package:myapp/screens/offline/localWidgets/tacsonomiaOffline.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';

import 'localWidgets/headOffline.dart';
import 'localWidgets/image_details_offline.dart';

class OfflineDetailsPlant extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineDetailsPlantController>(
        init: OfflineDetailsPlantController(),
        builder: (_)=>Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: PreferredSize(
            child: NavBar(
              scaffoldState: _scaffoldKey,
              title: "Information",
              startPage: false,
            ),
            preferredSize: Size(Get.width, 100),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                        //controller: controller, // Optional
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Stack(
                                children: [
                                  ImageDetailsOffline()
                                ],
                              ),
                              //borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  /***Title***/
                                  HeadShowOffline(
                                    data: _.speciesOfflineHive,
                                  ),
                                  /***Taxonomy***/
                                  TacsonomiaShowOffline(
                                    data: _.speciesOfflineHive,
                                  ),
                                  /***Specifications***/
                                  SpecificationsShowOffline(
                                    data: _.speciesOfflineHive,
                                  ),
                                  /***Growing***/
                                  GrowingOffline(data: _.speciesOfflineHive),
                                  /***Soil***/
                                  SoilShowOffline(
                                    data: _.speciesOfflineHive,
                                  ),


                                ],
                              ),
                            ),

                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
          drawer: Drawer(
            child: DrawerNav(),
          ),
        )
    );
  }
}
