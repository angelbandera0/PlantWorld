import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';

import 'constructorWidgetOffline.dart';

class GrowingOffline extends StatelessWidget {
  SpeciesOfflineHive data;
  GrowingOffline({this.data});
  ConstructorWidgetOffline cw = ConstructorWidgetOffline();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineDetailsPlantController>(
        init: OfflineDetailsPlantController(),
        builder: (_) => Column(
              children: [
                Divider(
                  height: 50,
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.seedling,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Growing",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.headline1.color,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Light:", "", ""),
                SizedBox(
                  height: 20,
                ),
                cw.sliderBar(data.growthLight, 0, 100, 10, FontAwesomeIcons.cloud,FontAwesomeIcons.solidSun,true),

                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Atmospheric Humidity:","", ""),
                SizedBox(
                  height: 20,
                ),
                cw.sliderBar(data.growthAtmosphericHumidity, 0, 100, 10, FontAwesomeIcons.cloudRain,null,true),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Ph:",
                    "Best between ",
                    data.growthPhMinimum.toString(),
                    " and ",
                    data.growthPhMaximum.toString(),
                    "",
                    ""),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Precipitations:",
                    "Best between ",
                    data.growthMinimumPrecipitation,
                    " and ",
                    data.growthMaximumPrecipitation,
                    "",
                    " mm"),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Temperature(°C):",
                    "Best between ",
                    data.growthMinimumTemperature,
                    " and ",
                    data.growthMaximumTemperature,
                    "",
                    " °C"),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Temperature(°F):",
                    "Best between ",
                    data.growthMinimumTemperature,
                    " and ",
                    data.growthMaximumTemperature,
                    "",
                    " °F"),
              ],
            ));
  }
}
