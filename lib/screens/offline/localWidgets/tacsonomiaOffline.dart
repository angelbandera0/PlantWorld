import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/Controllers/offline_details_plant_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/offline/localWidgets/constructorWidgetOffline.dart';

class TacsonomiaShowOffline extends StatelessWidget {
  SpeciesOfflineHive data;
  TacsonomiaShowOffline({this.data});
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
                cw.iconAndSubtitle(Icons.assignment, "Taxonomy"),
                SizedBox(
                  height: 20,
                ),
                cw.oneValueText("Kingdom:", data.kingdom,""),
                SizedBox(height: 20,),
                cw.oneValueText("Subkingdom:", data.subkingdom,""),
                SizedBox(height: 20,),
                cw.oneValueText("Division:", data.division,""),
                SizedBox(height: 20,),
                cw.oneValueText("Class:", data.divisionClass,""),
                SizedBox(height: 20,),
                cw.oneValueText("Order:", data.divisionOrder,""),
                SizedBox(height: 20,),
                cw.oneValueText("Family:", data.family,""),
                SizedBox(height: 20,),
                cw.oneValueText("Genus:", data.genus,""),
                SizedBox(height: 20,),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ));
  }
}
