import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_list_plant_controller.dart';
import 'package:myapp/Controllers/photo_file_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';

class CardOffline extends StatelessWidget {
  var photoFileController;
  SpeciesOfflineHive species;

  CardOffline(SpeciesOfflineHive species) {
    this.species = species;
    Get.create(() => PhotoFileController());
    photoFileController = (Get.find<PhotoFileController>());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineListPlantController>(
        builder: (_) => Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  FutureBuilder(
                      future: photoFileController.getLocalFile("${species.scientificName.removeAllWhitespace.toLowerCase() + species.id.toString()}.jpg"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null) {
                            return ClipRRect(
              child: Stack(
                children: [
                  (snapshot.data.existsSync())
                      ? Image.file(
                    snapshot.data,
                    height: Get.width * 0.5,
                    width: Get.width * 0.9,
                    fit: BoxFit.cover,
                  ): Container(
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
                        onTap: () =>
                            _.navigateToDetailsSpeciesOffline(species.id),
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
              borderRadius: BorderRadius.all(Radius.circular(20)));
                          } else {
                            return CircularProgressIndicator();
                          }
                        }
                        else {
                          return CircularProgressIndicator();
                        }
                      }),

                ],
              ),
            ));
  }
}
