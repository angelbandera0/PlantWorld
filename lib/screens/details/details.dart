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
  Species _species;
  SpeciesProvider _speciesProvider = SpeciesProvider();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> _listFlower = List();
  List<Widget> _listBark = List();
  List<Widget> _listFruit = List();
  List<Widget> _listHabitad = List();
  List<Widget> _listLeaf = List();
  List<Widget> _listOther = List();
  int cont = 0;
  Color _primaryTextColor = (Get.isDarkMode) ? Colors.white : Colors.black45;
  Color _secondaryTextColor =
      (Get.isDarkMode) ? Colors.white54 : Colors.black26;

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
                            //_.loadTacsonomia(snapshot.data.links);

                            /*snapshot.data.images.flower.forEach((element) {
                              _listFlower
                                  .add(containerImages(element.imageUrl));
                            });
                            snapshot.data.images.fruit.forEach((element) {
                              _listFruit.add(containerImages(element.imageUrl));
                            });
                            snapshot.data.images.habit.forEach((element) {
                              _listHabitad
                                  .add(containerImages(element.imageUrl));
                            });
                            snapshot.data.images.bark.forEach((element) {
                              _listBark.add(containerImages(element.imageUrl));
                            });
                            snapshot.data.images.other.forEach((element) {
                              _listOther.add(containerImages(element.imageUrl));
                            });
                            snapshot.data.images.leaf.forEach((element) {
                              _listLeaf.add(containerImages(element.imageUrl));
                            });*/
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
                                            /***Images***/
                                            /*ExpansionTile(
                                              //tilePadding: EdgeInsets.all(20),
                                              leading: Icon(
                                                Icons.image,
                                                color: Colors.green,
                                              ),

                                              title: Text(
                                                "Images",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .headline1
                                                        .color,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.clip,
                                              ),

                                              children: [
                                                /*ListTile(
                                                  title: Text(
                                                    "Flower",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listFlower,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Leaf",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listLeaf,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Fruit",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listFruit,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Bark",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listBark,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Habitad",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listHabitad,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Other",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  subtitle: Container(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: _listOther,
                                                      ),
                                                    ),
                                                    // margin: EdgeInsets.all(20),
                                                  ),
                                                ),*/
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),*/
                                            //Row(children: [Icon(Icons.image,color: Colors.green,),SizedBox(width: 10,),Text("Images",style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),],),
                                          ],
                                        ),
                                      ),
                                      /*ExpansionTile(
                                      //tilePadding: EdgeInsets.all(20),
                                      leading: Icon(Icons.image,color: Colors.green,),

                                      title:
                                      Text(
                                        "Images",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context).textTheme.headline1.color,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.clip,
                                      ),


                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Flower",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listFlower,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Leaf",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listLeaf,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Fruit",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listFruit,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Bark",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listBark,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Habitad",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listHabitad,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Other",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                          ),
                                          subtitle: Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: _listOther,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(20),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),*/
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

  Widget _paramnAndValueText(String p, String v) {
    return Row(
      children: [
        Text(
          p,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(Get.context).textTheme.headline1.color,
              fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          (v != "null") ? v : "unknown",
          style: TextStyle(
            fontSize: 16,
            color: (v != "null")
                ? Theme.of(Get.context).textTheme.subtitle1.color
                : Colors.red,
            decoration: (v != "null") ? null : TextDecoration.underline,
            decorationStyle: (v != "null") ? null : TextDecorationStyle.dotted,
          ),
          overflow: TextOverflow.clip,
        )),
      ],
    );
  }

  Widget _iconAndValueText(
      IconData icon, String textParanm1, List<String> listString) {
    List<TextSpan> lw = List<TextSpan>();
    String textBool;
    if (textParanm1 != "null") {
      if (listString[listString.length - 1] == "flowers" ||
          listString[listString.length - 1] == "fruits") {
        textBool = (textParanm1 == "true") ? "Visible" : "Invisible";
      } else {
        textBool = (textParanm1 == "true") ? "Persistent" : "Not Persistent";
      }
    } else {
      textBool = "unknown, ";
    }
    listString.forEach((element) {
      if (element[0] == "[") {
        element = element.substring(1, element.length - 1);
      }
      bool isNulo = element != "null";
      lw.add(TextSpan(
          text: ", ",
          style: TextStyle(
              color: Theme.of(Get.context).textTheme.subtitle1.color)));
      lw.add(TextSpan(
          text: (isNulo) ? "$element" : "unknown",
          style: TextStyle(
            color: (isNulo)
                ? Theme.of(Get.context).textTheme.subtitle1.color
                : Colors.red,
            decoration: (isNulo) ? null : TextDecoration.underline,
            decorationStyle: (isNulo) ? null : TextDecorationStyle.dotted,
          )));
    });
    return Row(
      children: [
        FaIcon(
          icon,
          color: Theme.of(Get.context).textTheme.headline1.color,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text.rich(
          TextSpan(
            text: textBool,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(Get.context).textTheme.subtitle1.color),
            children: lw,
          ),
        )),
      ],
    );
  }

  void fetchSpecies() {
    /*_speciesProvider.getSpeciest(widget.idSpecies).then((value) {
      setState(() {
        _species=value;
      });

    });*/
  }
  /*Widget containerImages(String url) {
    return GestureDetector(
        onTap: () => _showImage(Get.context, url, (cont).toString()),
        child: Hero(
            tag: ++cont,
            child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => SizedBox(
                    height: Get.width * 0.5,
                    width: Get.width * 0.9,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 14.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  fit: BoxFit.cover,
                  imageUrl: url,
                  height: 100,
                  width: 100,
                ))));
  }*/
}
