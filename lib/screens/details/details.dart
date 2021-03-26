import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/providers/species_provider.dart';
import 'package:myapp/screens/details/local_widgets/growing.dart';
import 'package:myapp/screens/details/local_widgets/head.dart';
import 'package:myapp/screens/details/local_widgets/mainImageSpecies.dart';
import 'package:myapp/screens/details/local_widgets/soil.dart';
import 'package:myapp/screens/details/local_widgets/specifications.dart';
import 'package:myapp/screens/details/local_widgets/tacsonomia.dart';
import 'package:myapp/screens/search/localWidgets/source.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:shimmer/shimmer.dart';

class DetailsPlant extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    //print(_species.scientificName);
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (_) => Scaffold(
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
                  //FondoApp(),
                  FutureBuilder(
                      future: _.fetchData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Species> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null) {
                            return Column(
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
                                            MainImageSpecies(
                                              imageUrl: snapshot.data.imageUrl,
                                              cont: cont,
                                            ),
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
                                            HeadShow(
                                              data: snapshot.data,
                                            ),
                                            /***Taxonomy***/
                                            TacsonomiaShow(
                                              data: snapshot.data,
                                            ),
                                            /***Specifications***/
                                            SpecificationsShow(
                                              data: snapshot.data,
                                            ),
                                            /***Growing***/
                                            GrowingShow(data: snapshot.data),
                                            /***Soil***/
                                            SoilShow(
                                              data: snapshot.data,
                                            ),
                                            LinkWebShow(
                                              data: snapshot.data,
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                )),
                              ],
                            );
                          } else {
                            return ProgressHUD(
                              backgroundColor: Colors.black12,
                              color: Colors.white,
                              containerColor: Colors.green,
                              borderRadius: 5.0,
                              text: (_.connectionStatus!="none")?'Loading...':'Trying to connect...',
                              loading: true,
                            );
                          }
                        } else {
                          return ProgressHUD(
                            backgroundColor: Colors.black12,
                            color: Colors.white,
                            containerColor: Colors.green,
                            borderRadius: 5.0,
                            text: 'Loading...',
                            loading: true,
                          );
                        }
                      })
                ],
              ),
              drawer: Drawer(
                child: DrawerNav(),
              ),
            ));
  }
}
