import 'dart:io';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/hive_global_controller.dart';
import 'package:myapp/config/hive.dart';
import 'package:myapp/enums/options.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/shared_preferences/settings.dart';
import 'package:myapp/support_class/string.dart';
import 'package:myapp/themes/app_theme.dart';
import 'package:flutter/services.dart';
import 'Controllers/connectivity_global_controller.dart';
import 'connectivity/flutter_connectivity.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/hive/speciesOfflineHive.dart';

List<Box> boxList = [];
Future<List<Box>> _openBox() async {
  final appDocumentDirectory =  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  var box_session = await Hive.openBox("images_urls");
  var box_comment = await Hive.openBox("species");
  boxList.add(box_session);
  boxList.add(box_comment);
  return boxList;
}

//Metodo Principal
void main() async {
  //Init Shared Preferences
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  final appDocumentDirectory =  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  //_openBox();u
  Hive.registerAdapter(SpeciesOfflineHiveAdapter());

  //Start MyApp
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    //Evita la rotacion de la pantalla
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }
  @override
  void dispose(){
    Hive.box('images_urls').compact();
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("Dark Mode is: ${PreferenceUtils.getBool("darkMode",false)}");
    Get.put(HiveGlobalController());
    Get.put(ConnectivityGlobalController());

    return FeatureDiscovery(child:GetMaterialApp(
      theme: (!PreferenceUtils.getBool(StringAuxMethods().enumToString(Options.darkMode),false))?AppTheme.lightTheme:AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Plant World',
      home: Home(),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('es')],
    ));
  }
}


