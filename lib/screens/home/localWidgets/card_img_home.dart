import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Controllers/photo_file_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/settings.dart';

class CardImgHome extends StatelessWidget {
  var photoFileController;
  SpeciesOfflineHive species;

  CardImgHome(SpeciesOfflineHive species) {
    this.species = species;
    Get.create(() => PhotoFileController());
    photoFileController = (Get.find<PhotoFileController>());
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: FutureBuilder(
            future: photoFileController.getLocalFile(
                "${species.scientificName.removeAllWhitespace.toLowerCase() + species.id.toString()}.jpg"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {

                  return Material(
                    color: Colors.grey[800],
                    child: Center(
                      child: Ink.image(
                        image: FileImage(snapshot.data),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        height: Get.width * 0.5,
                        width: Get.width * 0.9,
                        child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              Get.to(Settings());

                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        species.scientificName.toString(),
                                        overflow: TextOverflow.clip,

                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        species.commonName.toString(),
                                        overflow: TextOverflow.clip,

                                        style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Viewed: ${DateFormat.yMd().format(DateTime.parse(species.date.toString()))}",
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                            )),
                      ),
                    ),
                  );

                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            }),
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}
