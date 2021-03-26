import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';

import 'constructorWidget.dart';

class GrowingShow extends StatelessWidget {
  Species data;
  GrowingShow({this.data});
  ConstructorWidget cw = ConstructorWidget();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
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
                cw.sliderBar(data.growth.light, 0, 100, 10, FontAwesomeIcons.cloud,FontAwesomeIcons.solidSun,true),

                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Atmospheric Humidity:","", ""),
                SizedBox(
                  height: 20,
                ),
                cw.sliderBar(data.growth.atmosphericHumidity, 0, 100, 10, FontAwesomeIcons.cloudRain,null,true),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Ph:",
                    "Best between ",
                    data.growth.phMinimum.toString(),
                    " and ",
                    data.growth.phMaximum.toString(),
                    "",
                    ""),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Precipitations:",
                    "Best between ",
                    data.growth.minimumPrecipitation?.mm,
                    " and ",
                    data.growth.maximumPrecipitation?.mm,
                    "",
                    " mm"),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Temperature(°C):",
                    "Best between ",
                    data.growth.minimumTemperature?.degC.toString(),
                    " and ",
                    data.growth.maximumTemperature?.degC.toString(),
                    "",
                    " °C"),
                SizedBox(
                  height: 20,
                ),
                cw.twoValueText(
                    "Temperature(°F):",
                    "Best between ",
                    data.growth.minimumTemperature?.degF.toString(),
                    " and ",
                    data.growth.maximumTemperature?.degF.toString(),
                    "",
                    " °F"),
              ],
            ));
  }
}
