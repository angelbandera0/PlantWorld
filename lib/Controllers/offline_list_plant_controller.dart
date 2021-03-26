import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:myapp/Controllers/hive_global_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/offline/offline_details_plant.dart';

class OfflineListPlantController extends GetxController {
  Box _offbox;
  List<dynamic> _list = [];

  get list => _list;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._offbox = Get.find<HiveGlobalController>().mapBoxes["species"];
    loadSpecies();
  }

  loadSpecies() {
    _list = _offbox.values.toList();
  }

  search(String s) {
    _list = _offbox.values
        .toList()
        .where((element) =>
            element.scientificName.toLowerCase().contains(s) ||
            element.slug.toLowerCase().contains(s) ||
            element.commonName.toLowerCase().contains(s))
        .toList();
    update();
  }

  navigateToDetailsSpeciesOffline(int id) {
    Get.to(OfflineDetailsPlant(),
        arguments: {'id': id}, transition: Transition.rightToLeftWithFade);
  }
}
