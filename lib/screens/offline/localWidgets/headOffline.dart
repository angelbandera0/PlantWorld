import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';

import 'constructorWidgetOffline.dart';

class HeadShowOffline extends StatelessWidget {
  SpeciesOfflineHive data;
  HeadShowOffline({this.data});
  ConstructorWidgetOffline cw = ConstructorWidgetOffline();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineDetailsPlantController>(
        init: OfflineDetailsPlantController(),
        builder: (_) => Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(
              data.scientificName,
              style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).textTheme.headline1.color,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
            ),
            Text(
              data.commonName ?? "",
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.subtitle1.color),
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.book,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                      data.author +
                          " " +
                          data.year.toString() +
                          " - " +
                          data.bibliography,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.subtitle1.color),
                      overflow: TextOverflow.clip,
                    )),
              ],
            ),
          ],
        ));
  }
}
