import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/enums/options.dart';
import 'package:myapp/shared_preferences/settings.dart';
import 'package:myapp/support_class/string.dart';
import 'package:myapp/widgets/notificacion_flusbar.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class SettingsController extends GetxController {
  StringAuxMethods _stringAuxMethods = StringAuxMethods();
  Box _boxImagesUrls;
  var cacheSize = 0.obs;
  var dbSizeSpecies = 0.obs;
  var dbSizeImagesUrls = 0.obs;
  Box get box => this._boxImagesUrls;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sizesCacheAndStorage();
    //_box.delete(43545);
  }
  void sizesCacheAndStorage() async{
    dbSize();

    Future.sync(() {
      Hive.openBox('images_urls').then((value) {
        _boxImagesUrls = value;
        _boxImagesUrls.keys.forEach((element) {
          DefaultCacheManager()
              .getFileFromCache(_boxImagesUrls.get(element))
              .then((value) {
            // print(value.file.lengthSync());
            cacheSize += value.file.lengthSync();
            print(cacheSize.toString() + "zfjdzlfjlzj");
          }).catchError((error){});
        });
      });
    });
  }

  bool getBoolByOption(Options o, [bool defaulValue]) {
    String keyName = _stringAuxMethods.enumToString(o);
    return PreferenceUtils.getBool(keyName, defaulValue);
  }

  void setBoolByOption(bool newValue, Options o) {
    String keyName = _stringAuxMethods.enumToString(o);
    PreferenceUtils.setBool(keyName, newValue);
    if (o != Options.downloadAuto) {
      update([keyName]);
    } else {
      for (int i = 4; i < Options.values.length; i++) {
        PreferenceUtils.setBool(
            _stringAuxMethods.enumToString(Options.values[i]), !newValue);
      }
      update(["settings"]);
    }
  }

  void restartDefaulBoolValues() {
    Options.values.forEach((e) {
      bool value = !(e == Options.darkMode || e == Options.downloadAuto);
      PreferenceUtils.setBool(_stringAuxMethods.enumToString(e), value);
    });
    update(["settings"]);
  }

  initBox() {
    Hive.openBox('images_urls').then((value) => _boxImagesUrls = value);
  }

  dbSize() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    FileSystemEntity sp;
    FileSystemEntity im;
    appDocumentDirectory.listSync().forEach((element) {
      if (element.path.contains("species.hive")) {
        dbSizeSpecies += element.statSync().size;
      }
      if (element.path.contains("images_urls.hive")) {
        dbSizeImagesUrls += element.statSync().size;
      }
    });
    print(dbSizeSpecies.toString()+" "+dbSizeImagesUrls.toString());
  }

  clearCache(){
    DefaultCacheManager().emptyCache();
    box.clear();
    cacheSize=0.obs;
    dbSizeImagesUrls=0.obs;
    Get.snackbar("Notification:", "Cache clear sucessfully.",
        icon: Icon(
          Icons.info_outline,
          size: 32,
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
        borderRadius: 30,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,colorText: Colors.white);
    //NotificationFlushbar().notificar("Cache clear sucessfully", Icons.info_outline);
    update(["settings"]);

  }
  clearDataBase(){
      Hive.openBox('species').then((value) {
        value.clear();
        print(value.keys);
        dbSizeSpecies=0.obs;
        Get.snackbar("Notification:", "Database clear sucessfully.",
            icon: Icon(
              Icons.info_outline,
              size: 32,
              color: Colors.white,
            ),
            margin: EdgeInsets.all(10),
            borderRadius: 25,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,colorText: Colors.white);
        //NotificationFlushbar().notificar("Database clear sucessfully", Icons.info_outline);

        update(["settings"]);

      });
  }

}
