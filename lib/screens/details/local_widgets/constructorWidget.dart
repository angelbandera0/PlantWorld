import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/models/SpeciesModels/source.dart';
import 'package:url_launcher/url_launcher.dart';

class ConstructorWidget {
  bool isValNullOrUnknown(dynamic v) {
    return v == null || v == "null" || v == "unknown";
  }

  TextSpan textValidOrUnknown(dynamic v) {
    bool a = isValNullOrUnknown(v);
    return TextSpan(
      text: (a) ? "unknown" : v.toString(),
      style: TextStyle(
        color:
            (!a) ? Theme.of(Get.context).textTheme.subtitle1.color : Colors.red,
        decoration: (!a) ? null : TextDecoration.underline,
        decorationStyle: (!a) ? null : TextDecorationStyle.dotted,
      ),
    );
  }

  TextSpan VisibleOrInvisible(dynamic v) {
    bool a = isValNullOrUnknown(v);
    return TextSpan(
      text: (a)
          ? "unknown"
          : (v)
              ? "Visible"
              : "Invisible",
      style: TextStyle(
        color:
            (!a) ? Theme.of(Get.context).textTheme.subtitle1.color : Colors.red,
        decoration: (!a) ? null : TextDecoration.underline,
        decorationStyle: (!a) ? null : TextDecorationStyle.dotted,
      ),
    );
  }

  TextSpan PersintentOrNot(dynamic v) {
    bool a = isValNullOrUnknown(v);
    return TextSpan(
      text: (a)
          ? "unknown"
          : (v)
              ? "Persistent"
              : "Not Persistent",
      style: TextStyle(
        color:
            (!a) ? Theme.of(Get.context).textTheme.subtitle1.color : Colors.red,
        decoration: (!a) ? null : TextDecoration.underline,
        decorationStyle: (!a) ? null : TextDecorationStyle.dotted,
      ),
    );
  }

  Widget oneValueText(String tit, dynamic v, String finalS) {
    Function f;
    if (tit == "Conspicuous:")
      f = VisibleOrInvisible;
    else if (tit == "Leaf Retention:")
      f = PersintentOrNot;
    else
      f = textValidOrUnknown;
    return Row(
      children: [
        Text(
          tit,
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
            child: RichText(
                overflow: TextOverflow.clip,
                text: TextSpan(style: TextStyle(fontSize: 16), children: [
                  f(v),
                  TextSpan(
                    text: finalS,
                    style: TextStyle(
                        color: Theme.of(Get.context).textTheme.subtitle1.color),
                  )
                ]))),
      ],
    );
  }

  Widget twoValueText(String tit, String startS, dynamic v1, String middleS,
      dynamic v2, String finalS, String metrica) {
    return Row(
      children: [
        Text(
          tit,
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
            child: RichText(
                overflow: TextOverflow.clip,
                text: TextSpan(style: TextStyle(fontSize: 16), children: [
                  textPart(startS),
                  textValidOrUnknown(v1),
                  textPart(metrica),
                  textPart(middleS),
                  textValidOrUnknown(v2),
                  textPart(metrica),
                  textPart(finalS),
                ]))),
      ],
    );
  }

  Widget iconAndSubtitle(IconData icon, String s) {
    return Row(
      children: [
        FaIcon(
          icon,
          color: Colors.green,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          s,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(Get.context).textTheme.headline1.color,
              fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  TextSpan textPart(String t) {
    return TextSpan(
      text: t,
      style: TextStyle(color: Theme.of(Get.context).textTheme.subtitle1.color),
    );
  }

  Widget sliderBar(double value, double min, double max, int divisions,
      IconData iconS, IconData iconF, bool isPercent) {
    return Row(children: [
      Icon(
        iconS,
        color: Theme.of(Get.context).textTheme.headline1.color,
      ),
      (value != null)
          ? Slider(
              value: (isPercent) ? value * 10 : value,
              min: min,
              max: max,
              divisions: divisions,
              inactiveColor: Theme.of(Get.context).textTheme.headline1.color,
              activeColor: Colors.green,
              label:
                  "Value: ${(isPercent) ? (value * 10).toString() + "%" : value}",
              onChanged: (r) {},
            )
          : RichText(
              text: TextSpan(
              text: "Unknow Value",
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
              ),
            )).marginOnly(left: 20, right: 20),
      (iconF != null)
          ? Icon(
              iconF,
              color: Theme.of(Get.context).textTheme.headline1.color,
            )
          : Container()
    ]);
  }

  Widget linkList(List<Source> ls){
    List<Widget> lw=[];
    ls.forEach((element) {
      if(element.url!=null) {
        lw.add(RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: element.name,
                style: new TextStyle(color: Colors.green),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    launch('${element.url}');
                  },
              ),
            ],
          ),));
        lw.add(SizedBox(height: 20,));
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lw,
    );

  }
}
