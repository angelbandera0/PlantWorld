import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/details/local_widgets/constructorWidget.dart';

class SoilShow extends StatelessWidget {
  Species data;
  SoilShow({this.data});
  ConstructorWidget cw = ConstructorWidget();
  @override
  Widget build(BuildContext context) {
    print(data.growth.soilSalinity ?? 0);
    return GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (_) => Column(children: [
              Divider(
                height: 50,
              ),
              Row(
                children: [
                  Icon(
                    Icons.terrain,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Soil",
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
              _paramnAndValueText("Soil humidity:", ""),
              SizedBox(
                height: 20,
              ),
              cw.sliderBar(data.growth.soilHumidity, 0, 10, 10,
                  FontAwesomeIcons.fillDrip, null, false),
              SizedBox(
                height: 20,
              ),
              _paramnAndValueText("Soil nutriments:", ""),
              SizedBox(
                height: 20,
              ),
              cw.sliderBar(data.growth.soilNutriments, 0, 10, 10,
                  FontAwesomeIcons.mortarPestle, null, false),
              SizedBox(
                height: 20,
              ),
              _paramnAndValueText("Soil salinity:", ""),
              SizedBox(
                height: 20,
              ),
              cw.sliderBar(data.growth.soilSalinity, 0, 10, 10,
                  FontAwesomeIcons.react, null, false),
              SizedBox(
                height: 20,
              ),
              _paramnAndValueText("Soil texture:", ""),
              SizedBox(
                height: 20,
              ),
              cw.sliderBar(
                  data.growth.soilTexture,
                  0,
                  10,
                  10,
                  FontAwesomeIcons.dotCircle,
                  FontAwesomeIcons.solidDotCircle,
                  false),
            ]
        )
    );
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
}
