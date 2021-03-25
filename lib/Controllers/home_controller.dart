import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/connectivity_global_controller.dart';
import 'package:myapp/Controllers/hive_global_controller.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/screens/search/search.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HomeController extends GetxController {
  StreamSubscription<String> _subscription;
  RxMap<String, Box> _mapBoxes = RxMap<String, Box>();
  Box _box;

  Box get box => this._box;
  RxMap get mapBoxes => this._mapBoxes;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    final connectivityGlobalController=Get.find<ConnectivityGlobalController>();
    _subscription = connectivityGlobalController.connectionStatus.listen((data) {
      print('Connection: $data');
    });
  }
  @override
  void onClose(){
    super.onClose();
    _subscription.cancel();
  }
  navigateToSeachSpecies(String text) {
    Get.to(Search(),
        arguments: {'textSearch': text},
        transition: Transition.rightToLeftWithFade);
  }

  Future<Box<dynamic>> initBox()async{
      final appDocumentDirectory =  await path_provider.getApplicationDocumentsDirectory();
      await  Hive.init(appDocumentDirectory.path);
      return await Hive.openBox("species");
  }

}
