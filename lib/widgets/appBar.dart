import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  final GlobalKey<ScaffoldState> scaffoldState;
  final String title;
  final bool startPage;

  NavBar({@required this.scaffoldState, this.title, this.startPage});

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        _deviceData=deviceData;

      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  @override
  Widget build(BuildContext context) {
    initPlatformState();

    Color color = Colors.white;
    return Container(
        //color: Colors.green,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 25, 10, 0),

          //color: Colors.blue,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (startPage)
                  ? IconButton(
                      icon: Icon(
                        Icons.dehaze,
                        size: 28,
                        color: color,
                      ),
                      onPressed: () => scaffoldState.currentState.openDrawer())
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                        color: color,
                      ),
                      onPressed: () => Get.back(canPop: true)),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color, fontSize: 25),
              ),
              (startPage)
                  ? IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        size: 28,
                        color: color.withOpacity(0),
                      ),
                      onPressed: () {

                      })
                  : IconButton(
                      icon: Icon(
                        Icons.dehaze,
                        size: 28,
                        color: color,
                      ),
                      onPressed: () => scaffoldState.currentState.openDrawer()),
            ],
          ),
        ),
        decoration: BoxDecoration(
          //boxShadow: [BoxShadow(color: Colors.black45,spreadRadius: 2,blurRadius: 3)],
          gradient: LinearGradient(colors: [
            Colors.teal,
            Colors.green,
          ]),
        ));
  }
}
