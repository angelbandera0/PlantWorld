import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/providers/species_provider.dart';
import 'package:myapp/screens/details/details.dart';
import 'package:myapp/support_class/uriAux.dart';
import 'package:myapp/widgets/notificacion_flusbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';
import 'connectivity_global_controller.dart';

class SearchController extends GetxController {
  bool _onTop;
  bool _down = false;
  bool _isLoading;

  int _itemsFound;
  String _textSearch;
  String _connectionMode;
  ListSpecies _listSpeciesObj;
  List<Species> _listSpecies = [];
  SpeciesProvider _speciesProvider = SpeciesProvider();
  ScrollController _scrollController = ScrollController();
  DefaultCacheManager _defaultCacheManager = DefaultCacheManager();
  String _connectionStatus = 'none';
  StreamSubscription<String> _subscription;
  Box _box;

  /*
  Getter
   */
  bool get onTop => this._onTop;

  bool get down => this._down;

  Box get box => this._box;

  bool get isLoading => this._isLoading;

  int get itemsFounds => this._itemsFound;

  String get textSearch => this._textSearch;

  String get connectionMode => this._connectionMode;

  String get connectionStatus => this._connectionStatus;

  List<Species> get listSpecies => this._listSpecies;

  ListSpecies get listSpeciesObj => this._listSpeciesObj;

  ScrollController get scrollController => this._scrollController;

  DefaultCacheManager get defaultCacheManage => this._defaultCacheManager;

  /*
  Setter
   */
  void setTextSearch(String newValue) => _textSearch = newValue;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _subscription.cancel();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadSpecies();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isLoading = true;
    _onTop = true;
    _textSearch = (Get.arguments as Map<String, dynamic>)["textSearch"];
    _scrollController.addListener(() {
      _onTop = (_scrollController.offset > 150);
      update(["floatingActionButton"]);
    });
    final connectivityGlobalController =
        Get.find<ConnectivityGlobalController>();
    _connectionStatus = connectivityGlobalController.connectionStatus.value;

    _subscription =
        connectivityGlobalController.connectionStatus.listen((data) {
      _connectionStatus = data;
    });
    initBox();
    //_startDirectoryRoute();
  }

  loadSpecies() {
    _isLoading = true;
    if (connectionStatus == "none") {
      NotificationGetx()
          .notificar("No Internet Connection", Icons.error, "Error");
      _isLoading = false;
      update(["loading"]);
    } else {
      update(["loading"]);
      _speciesProvider.getListSpeciesByString(_textSearch).then((value) {
        _listSpeciesObj = value;
        _listSpecies = value.items;
        _itemsFound = value.meta.total;
        _isLoading = false;
        update(["listSpecies", "loading"]);
      }).catchError((error) {
        _isLoading = false;
        update(["listSpecies", "loading", "floatingActionButton"]);
      });
    }
  }

  loadMoreSpecies() {
    _isLoading = true;
    update(["loading"]);
    int page =
        int.parse(UriAux().parametersUrl(_listSpeciesObj.links.next)['page']);
    _speciesProvider.getListSpeciesByString(_textSearch, page).then((value) {
      _listSpecies =
          [_listSpecies, value.items].expand((element) => element).toList();
      _listSpeciesObj = value;
      _isLoading = false;
      update(["listSpecies", "loading"]);
    }).catchError((error) {
      throw error;
    });
  }

  srollToTop() {
    _scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  initBox() {
    Hive.openBox('images_urls').then((value) => _box = value);
  }

  navigateToDetailsSpecies(int id) {
    Get.to(DetailsPlant(),
        arguments: {'id': id}, transition: Transition.rightToLeftWithFade);
  }
}
