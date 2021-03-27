import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/screens/details/local_widgets/constructorWidget.dart';

class SpecificationsShow extends StatelessWidget {
  Species data;
  SpecificationsShow({this.data});
  ConstructorWidget cw = ConstructorWidget();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        init: DetailsController(),
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
                cw.oneValueText("Height:", data.specifications.averageHeight.cm,
                    " cm average"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Growth habit:", data.specifications.growthHabit, ""),
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
                cw.oneValueText("Conspicuous:", data.flower.conspicuous, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Flower Colors:", data.flower.color.toString().replaceAll("[", "").replaceAll("]", ""), ""),
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(
                    FontAwesomeIcons.canadianMapleLeaf, "Foliage"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Leaf Retention:", data.foliage.leafRetention, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Texture:", data.foliage.texture, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Color:", data.foliage.color, ""),
                Divider(
                  height: 50,
                ),
                cw.iconAndSubtitle(FontAwesomeIcons.solidLemon, "Fruits"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText(
                    "Conspicuous:", data.fruitOrSeed.conspicuous, ""),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Fruit Colors:", data.fruitOrSeed.color, ""),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ));
  }
}
