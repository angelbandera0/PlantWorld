
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/Controllers/photo_file_controller.dart';
import 'package:shimmer/shimmer.dart';

class ImageDetailsOffline extends StatelessWidget {
  String imageUrl;
  int cont;
  PhotoFileController photoFileController;

  ImageDetailsOffline(){
    Get.create(() => PhotoFileController());
    photoFileController = (Get.find<PhotoFileController>());
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<OfflineDetailsPlantController>(
      init: OfflineDetailsPlantController(),
      builder: (_) {
        return FutureBuilder(
      future: photoFileController.getLocalFile("${_.speciesOfflineHive.scientificName.toString().removeAllWhitespace.toLowerCase()}${ _.speciesOfflineHive.id.toString()}.jpg"),
    builder: (
    BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data != null) {
          if(snapshot.data.existsSync()){
            return GestureDetector(
              onTap: () => _showImage(
                  context,
                  snapshot.data,
                  0.toString()),
              child: Hero(
                  tag: 0,
                  child:Image.file(
                    snapshot.data,
                    height: Get.width * 0.5,
                    width: Get.width,
                    fit: BoxFit.cover,
                  )
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.teal[400],
                    Colors.green[400],
                  ]),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .center,
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                Icon(
                  Icons.insert_photo,
                  size: 100,
                  color: Colors.white54,
                ),
                Text(
                  "Photo not available",
                  style: TextStyle(
                      color: Colors
                          .white54,
                      fontSize: 25),
                )
              ],
            ),
            height: Get.width * 0.5,
            width: Get.width * 1,
          );
        }
        else {
          return CircularProgressIndicator();
        }
      }
      else {
        return CircularProgressIndicator();
      }
    }
    );});}

  void _showImage(BuildContext context, File file, String tag) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: Center(
            child: Hero(
                tag: tag,
                child: Image.file(
                  file,
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.fill,
                )),
          ),
        )
    )
    );
  }

}
