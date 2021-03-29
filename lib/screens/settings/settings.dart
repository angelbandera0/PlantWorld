import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Controllers/settings_controller.dart';
import 'package:myapp/enums/options.dart';
import 'package:myapp/models/connectivity/connection.dart';
import 'package:myapp/screens/settings/local_widgets/option_setting.dart';
import 'package:myapp/shared_preferences/settings.dart';
import 'package:myapp/support_class/string.dart';
import 'package:myapp/themes/app_theme.dart';
import 'package:myapp/widgets/appBar.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/fondo.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StringAuxMethods _stringAuxMethods = StringAuxMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        id: "settings",
        builder: (_) {
          print(filesize(_.cacheSize));
          return Scaffold(
            key: _scaffoldKey,
            appBar: PreferredSize(
              child: NavBar(
                scaffoldState: _scaffoldKey,
                title: "Settings",
                startPage: false,
              ),
              preferredSize: Size(Get.width, 100),
            ),
            body: Stack(
              children: [
                FondoApp(),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          child: Container(
                            width: Get.width * 0.9,
                            //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Apparence",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                OptionSetting(
                                  id: _stringAuxMethods
                                      .enumToString(Options.darkMode),
                                  nameOption: "Dark Mode",
                                  optionEnum: Options.darkMode,
                                  defaultValue: false,
                                  function: Get.changeTheme,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 4,
                            child: Container(
                              width: Get.width * 0.9,
                              //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Network",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  OptionSetting(
                                      id: _stringAuxMethods
                                          .enumToString(Options.wifi),
                                      nameOption: "Download Resources Wifi",
                                      optionEnum: Options.wifi,
                                      defaultValue: true,
                                      function: null),
                                  Divider(),
                                  OptionSetting(
                                      id: _stringAuxMethods
                                          .enumToString(Options.dataMobile),
                                      nameOption: "Download Resources Data",
                                      optionEnum: Options.dataMobile,
                                      defaultValue: true,
                                      function: null),
                                ],
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          child: Container(
                            width: Get.width * 0.9,
                            //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Storage",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Size in cache:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(() => Text(
                                        "${filesize(_.cacheSize.toString())}"))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Size database:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Obx(() => Text(
                                        "${filesize((_.dbSizeSpecies.value+_.dbSizeImagesUrls.value).toString())}"))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Clear Cache",
                                          content: Text(
                                              "Are you sure to clean the cache?"),
                                          textCancel: "Don't Clean",
                                          textConfirm: "Clean Cache",
                                          cancelTextColor: Colors.green,
                                          confirmTextColor: Colors.white,
                                          buttonColor: Colors.green,
                                          onConfirm: () {
                                            _.clearCache();
                                            Navigator.pop(context);

                                          },
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        side: BorderSide(
                                            color: Colors.green, width: 2),
                                      ),
                                      child: Text('Clear cache',style: TextStyle(color: Colors.green)),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Clear Database",
                                          content: Text(
                                              "Are you sure to clean the database?"),
                                          textCancel: "Don't Clean",
                                          textConfirm: "Clean Database",
                                          cancelTextColor: Colors.green,
                                          confirmTextColor: Colors.white,
                                          buttonColor: Colors.green,
                                          onConfirm: () {
                                            _.clearDataBase();
                                            Navigator.pop(context);
                                          },
                                        );
                                        },
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        side: BorderSide(
                                            color: Colors.green, width: 2),
                                      ),
                                      child: Text('Clear Database',style: TextStyle(color: Colors.green)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        SizedBox(
                            width: Get.width * 0.9,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Default Settings",
                                  content: Text(
                                      "Are you sure to reset the settings?"),
                                  textCancel: "Don't Restart",
                                  textConfirm: "Restart Config",
                                  cancelTextColor: Colors.green,
                                  confirmTextColor: Colors.white,
                                  buttonColor: Colors.green,
                                  onConfirm: () {
                                    _.restartDefaulBoolValues();
                                    Get.changeTheme(AppTheme.lightTheme);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              child: Text(
                                "Default Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: DrawerNav(),
            ),
          );
        });
  }
}
