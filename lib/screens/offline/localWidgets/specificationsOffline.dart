import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/offline/localWidgets/constructorWidgetOffline.dart';

class SpecificationsShowOffline extends StatelessWidget {
  SpeciesOfflineHive data;
  SpecificationsShowOffline({this.data});
  ConstructorWidgetOffline cw = ConstructorWidgetOffline();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfflineDetailsPlantController>(
        init: OfflineDetailsPlantController(),
        builder: (_) => Column(
              children: [

                //Specifications
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(Icons.settings, "Specifications"),
                SizedBox(
                  height: 20,
                ),
                Text.rich(TextSpan(
                    style: TextStyle(fontSize: 16),
                    children: [cw.textValidOrUnknown(data.observations)])),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Height:", data.specificationsAverageHeight,
                    " cm average"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Growth habit:", data.specificationsGrowthHabit, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Durations:", data.duration, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Edible part(s):", data.ediblePart, ""),
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(FontAwesomeIcons.spa, "Flowers"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Conspicuous:", data.flowerConspicuous, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Flower Colors:", data.flowerColor.toString().replaceAll("[", "").replaceAll("]", ""), ""),
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(
                    FontAwesomeIcons.canadianMapleLeaf, "Foliage"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Leaf Retention:", data.foliageLeafRetention, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Texture:", data.foliageTexture, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Color:", data.foliageColor, ""),
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(FontAwesomeIcons.solidLemon, "Fruits"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Conspicuous:", data.fruitOrSeedConspicuous, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Fruit Colors:", data.fruitOrSeedColor, ""),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ));
  }
}
