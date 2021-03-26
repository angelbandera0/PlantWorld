import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/details_controller.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/screens/details/local_widgets/constructorWidget.dart';

class TacsonomiaShow extends StatelessWidget {
  Species data;
  TacsonomiaShow({this.data});
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
                cw.iconAndSubtitle(Icons.assignment, "Taxonomy"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Kingdom:", _.kingdom,""),
                SizedBox(height: 20,),
                cw.oneValueText("Subkingdom:", _.subkingdom,""),
                SizedBox(height: 20,),
                cw.oneValueText("Division:", _.division,""),
                SizedBox(height: 20,),
                cw.oneValueText("Class:", _.divisionClass,""),
                SizedBox(height: 20,),
                cw.oneValueText("Order:", _.divisionOrder,""),
                SizedBox(height: 20,),
                cw.oneValueText("Family:", _.family,""),
                SizedBox(height: 20,),
                cw.oneValueText("Genus:", _.genus,""),
                SizedBox(height: 20,),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ));
  }
}
