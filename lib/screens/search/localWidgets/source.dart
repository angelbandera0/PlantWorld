import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/screens/details/local_widgets/constructorWidget.dart';

class LinkWebShow extends StatelessWidget {
  Species data;
  LinkWebShow({this.data});
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
            cw.iconAndSubtitle(Icons.list, "Links"),
            SizedBox(
              height: 20,
            ),
            cw.linkList(data.sources),
            SizedBox(height: 20,),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
