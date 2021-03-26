
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';

import 'hive_global_controller.dart';

class OfflineDetailsPlantController extends GetxController {
  int _id;
  Box _offbox;
  SpeciesOfflineHive _speciesOfflineHive;

  get id =>  _id;
  get speciesOfflineHive=> _speciesOfflineHive;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _id = (Get.arguments as Map<String, dynamic>)["id"];
    this._offbox = Get.find<HiveGlobalController>().mapBoxes["species"];
    loadData();
  }
  loadData(){
    _speciesOfflineHive=this._offbox.values.toList().firstWhere((element) => element.id==this._id);
  }
  
}