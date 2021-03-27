import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/photo_file_controller.dart';
import 'package:myapp/Controllers/search_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/screens/search/localWidgets/shimer.dart';
import 'package:myapp/shared_preferences/settings.dart';

class CardSearch extends StatelessWidget {
  PhotoFileController photoFileController;
  Species species;

  CardSearch(Species species) {
    this.species = species;
    Get.create(() => PhotoFileController());
    photoFileController = (Get.find<PhotoFileController>());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GetBuilder<SearchController>(
        id: species.id.toString(),
        builder: (controller) {
          return Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ClipRRect(
                    child: Stack(
                      children: [
                        (species.imageUrl != null)
                            ? loadImage(controller)
                            : Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.teal[400],
                                    Colors.green[400],
                                  ]),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.insert_photo,
                                      size: 100,
                                      color: Colors.white54,
                                    ),
                                    Text(
                                      "Photo not available",
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 25),
                                    )
                                  ],
                                ),
                                height: Get.width * 0.5,
                                width: Get.width * 0.9,
                              ),
                        Positioned(
                            top: Get.width * 0.35,
                            left: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      species.scientificName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //SizedBox(height: 5,),
                                    Text(
                                      (species.commonName != null)
                                          ? species.commonName
                                          : "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ],
                            )),
                        Positioned(
                            top: Get.width * 0.36,
                            left: Get.width * 0.75,
                            child: InkWell(
                              onTap: () => controller
                                  .navigateToDetailsSpecies(species.id),
                              //sc.inc(),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.green,
                                      Colors.lightGreen
                                    ]),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30))),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                                width: 55,
                                height: 55,
                              ),
                            ))
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ],
            ),
          );
        });
  }

  Widget loadImage(SearchController _) {
    //solo carga si hay conexion
    if (_.connectionStatus != "none") {
      bool connection = PreferenceUtils.getBool(_.connectionStatus, true);
      photoFileController
          .getLocalFile(
              "${species.scientificName.removeAllWhitespace.toLowerCase() + species.id.toString()}.jpg")
          .then((value) => print(value));
      //print("$connection ${photoFileController.isPosibleDown} ${_.box.get(species.id) != null} ${f.existsSync()}");
      if (connection ||
          (photoFileController
                  .isPosibleDown || //mapDownloads[widget.species.id.toString()] ||
              _.box.get(species.id) != null)) {
        if (species.imageUrl != null) {
          _.box.put(species.id, species.imageUrl);
        }

        return Stack(
          children: [
            FutureBuilder(
                future: photoFileController.getLocalFile(
                    "${species.scientificName.removeAllWhitespace.toLowerCase() + species.id.toString()}.jpg"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      //carga la imagen
                      if (snapshot.data.existsSync()) {
                        return new Image.file(
                          snapshot.data,
                          height: Get.width * 0.5,
                          width: Get.width * 0.9,
                          fit: BoxFit.cover,
                        );
                      }
                      //baja la imagen sino se encuentra
                      else {
                        return FutureBuilder(
                            future: photoFileController.downloadPhoto(
                                species.id.toString(),
                                species.scientificName,
                                species.imageUrl,
                                false),
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data != null) {
                                  print(snapshot.data.toString() +
                                      " mnf,zdnf,nzd,fn");
                                  return FutureBuilder(
                                      future: photoFileController.getLocalFile(
                                          "${species.scientificName.removeAllWhitespace.toLowerCase() + species.id.toString()}.jpg"),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data != null) {
                                            print(snapshot.data
                                                    .existsSync()
                                                    .toString() +
                                                " mnf,zdnf,nzd,fn");

                                            return new Image.file(
                                              snapshot.data,
                                              height: Get.width * 0.5,
                                              width: Get.width * 0.9,
                                              fit: BoxFit.cover,
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      });
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }
                              else {
                                return ShimmerLoad();
                              }
                            });
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  } else {
                    return Text("sdhkshdkzhd");
                  }
                }),
//            CachedNetworkImage(
//              placeholder: (context, url) =>
//              fit: BoxFit.cover,
//              imageUrl: widget.species.imageUrl,
//              errorWidget: (context, url, error) => Icon(Icons.error),
//              height: Get.width * 0.5,
//              width: Get.width * 0.9,
//            ),
            /*Container(
              color: Colors.black45.withOpacity(0.3),
              height: Get.width * 0.5,
              width: Get.width * 0.9,
            )*/
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 0.4,
                sigmaY: 0.4,
              ),
              child: Container(
                height: Get.width * 0.5,
                width: Get.width * 0.9,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.teal[400],
              Colors.green[400],
            ]),
          ),
          child: (!photoFileController.loadingDownloadPhoto)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () => photoFileController.downloadPhoto(
                            species.id.toString(),
                            species.scientificName,
                            species.imageUrl,
                            true),
                        child: Icon(
                          Icons.refresh,
                          size: 72,
                          color: Colors.white,
                        ))
                  ],
                )
              : Center(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          value: photoFileController.progress,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 6,
                        )),
                    Text(
                      '${(photoFileController.progress * 100).toStringAsFixed(0)}%',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
          height: Get.width * 0.5,
          width: Get.width * 0.9,
        );
      }
    }
  }
}
