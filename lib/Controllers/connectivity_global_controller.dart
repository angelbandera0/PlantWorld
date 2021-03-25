import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:myapp/widgets/notificacion_flusbar.dart';

class ConnectivityGlobalController extends GetxController {
  var _connectionStatus = ''.obs;
  final Connectivity _connectivity = Connectivity();
  RxString get connectionStatus => this._connectionStatus;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkConnection();
  }

  Future<void> checkConnection() async {
    await initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    return await _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    result = await Connectivity().checkConnectivity();
    switch (result) {
      case ConnectivityResult.wifi:
        _connectionStatus.value = "wifi";
        break;
      case ConnectivityResult.mobile:
        _connectionStatus.value = "dataMobile";
        break;
      case ConnectivityResult.none:
        _connectionStatus.value = "none";
        NotificationGetx().notificar("No Internet Connection.", Icons.error,"Error");
        break;
      default:
        NotificationGetx().notificar("Failed to get connectivity", Icons.error,"Error");
        _connectionStatus.value = 'Failed to get connectivity.';
        break;
    }
    print(_connectionStatus);
  }
}
