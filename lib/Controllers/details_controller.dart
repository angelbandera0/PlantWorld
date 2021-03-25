import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Controllers/home_controller.dart';
import 'package:myapp/models/division.dart';
import 'package:myapp/models/division_order.dart';
import 'package:myapp/models/genus.dart';
import 'package:myapp/models/hive/speciesOfflineHive.dart';
import 'package:myapp/models/species.dart';
import 'package:myapp/providers/genus_provider.dart';
import 'package:myapp/providers/species_provider.dart';
import 'package:myapp/support_class/uriAux.dart';

import 'connectivity_global_controller.dart';
import 'hive_global_controller.dart';

class DetailsController extends GetxController {
  bool _onTop;
  bool _down = false;
  bool _isLoading;
  int _itemsFound;
  RxString genus = RxString("");
  RxString family = RxString("");
  RxString divisionOrder = RxString("");
  RxString divisionClass = RxString("");
  RxString division = RxString("");
  RxString subkingdom = RxString("");
  RxString kingdom = RxString("");
  int _id;
  String _connectionMode;
  ListSpecies _listSpeciesObj;
  List<Species> _listSpecies = [];
  Map<String, bool> mapDownloads = Map<String, bool>();
  Map<String, Box> _mapBoxes = Map<String, Box>();
  SpeciesProvider _speciesProvider = SpeciesProvider();
  ScrollController _scrollController = ScrollController();
  DefaultCacheManager _defaultCacheManager = DefaultCacheManager();
  Map _source = {ConnectivityResult.none: false};
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
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
  int get id => this._id;
  String get connectionMode => this._connectionMode;
  String get connectionStatus => this._connectionStatus;
  List<Species> get listSpecies => this._listSpecies;
  ListSpecies get listSpeciesObj => this._listSpeciesObj;
  ScrollController get scrollController => this._scrollController;
  DefaultCacheManager get defaultCacheManage => this._defaultCacheManager;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    //_connectivity.disposeStream();
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
    _mapBoxes = Get.find<HiveGlobalController>().mapBoxes;
    _box = _mapBoxes["imagesUrls"];
    _isLoading = true;
    _id = (Get.arguments as Map<String, dynamic>)["id"];

    final connectivityGlobalController =
    Get.find<ConnectivityGlobalController>();
    _connectionStatus = connectivityGlobalController.connectionStatus.value;

    _subscription =
        connectivityGlobalController.connectionStatus.listen((data) {
          _connectionStatus = data;
        });
  }


  loadSpecies() {
    _isLoading = true;
    if (connectionStatus == "none") {
//      NotificationFlushbar().notificar("No Internet Connection.", Icons.error);
    } else {
      update(["loading"]);

    }
  }

  downloadPhoto(String id) {
    mapDownloads[id] = true;
    update([id]);
  }

  Future<void> loadTacsonomia(SpeciesLinks sl) async {
    UriAux uriAux = UriAux();
    var jsonDivisionOrders =
        jsonDecode(await getJson('assets/json/division_orders_sets.json'));
    var jsonDivision =
        jsonDecode(await getJson('assets/json/division_sets.json'));
    ListDivisionOrder listDO =
        ListDivisionOrder.fromJsonList(jsonDivisionOrders);
    ListDivision listD = ListDivision.fromJsonList(jsonDivision);
    if (sl.genus != null) {
      String url = uriAux.fragmentUrl(sl.genus).last;
      ListGenus lg = await GenusProvider().getListGenusByString(url);
      Genus g = lg.items.first;
      this.genus.value = g.name;
      this.family.value = g.family.name;

      if (g.family.links.divisionOrder != null) {
        url = uriAux.fragmentUrl(g.family.links.divisionOrder).last;
        DivisionOrder divOrd = listDO.items.firstWhere((element) => element.slug == url);
        this.divisionOrder.value = divOrd.name;
        this.divisionClass.value = divOrd.divisionClass.name;
        if (divOrd.divisionClass.links.division != null) {
          url = uriAux.fragmentUrl(divOrd.divisionClass.links.division).last;
          Division div =
              listD.items.firstWhere((element) => element.slug == url);
          this.division.value = div.name;
          this.subkingdom.value = div.subkingdom.name;
          this.kingdom.value = div.subkingdom.kingdom.name;
        }
      }
    }
  }

  Future<Species> fetchData() async {
    Species s = await _speciesProvider.getSpeciest(this.id);
    await loadTacsonomia(s.links);
    await registerSpecieOffline(s);
    return s;
  }

  Future<String> getJson(String urlFile) {
    return rootBundle.loadString(urlFile);
  }

  void registerSpecieOffline(Species s) async {
    try {
      _mapBoxes["species"].put(s.id,new SpeciesOfflineHive(
        id: s.id,
        commonName: s.commonName,
        slug: s.slug,
        scientificName: s.scientificName,
        year: s.year,
        bibliography: s.bibliography,
        author: s.author,
        status: s.status,
        rank: s.rank,
        familyCommonName: s.familyCommonName,
        genusId: s.genusId,
        observations: s.observations,
        vegetable: s.vegetable,
        imageUrl: s.imageUrl,
        genus: s.genus,
        family: s.family,
        duration: s.duration,
        ediblePart: s.ediblePart,
        edible: s.edible,
        flowerColor: s.flower.color,
        flowerConspicuous: s.flower.conspicuous,
        foliageTexture: s.foliage.texture,
        foliageColor: s.foliage.color,
        foliageLeafRetention: s.foliage.leafRetention,
        fruitOrSeedConspicuous: s.fruitOrSeed.conspicuous,
        fruitOrSeedColor: s.fruitOrSeed.color.toString(),
        fruitOrSeedShape: s.fruitOrSeed.shape,
        fruitOrSeedSeedPersistence: s.fruitOrSeed.seedPersistence,
        specificationsLigneousType: s.specifications.ligneousType,
        specificationsGrowthForm: s.specifications.growthForm,
        specificationsGrowthHabit: s.specifications.growthHabit,
        specificationsGrowthRate: s.specifications.growthRate,
        specificationsAverageHeight: s.specifications.averageHeight.cm,
        specificationsMaximumHeight: s.specifications.maximumHeight.cm,
        specificationsNitrogenFixation: s.specifications.nitrogenFixation,
        specificationsShapeAndOrientation: s.specifications.shapeAndOrientation,
        specificationsToxicity: s.specifications.toxicity,
        growthDescription: s.growth.description,
        growthSowing: s.growth.sowing,
        growthDaysToHarvest: s.growth.daysToHarvest,
        growthRowSpacing: s.growth.rowSpacing.cm,
        growthSpread: s.growth.spread.cm,
        growthPhMaximum: s.growth.phMaximum,
        growthPhMinimum: s.growth.phMinimum,
        growthLight: s.growth.light,
        growthAtmosphericHumidity: s.growth.atmosphericHumidity,
        growthGrowthMonths: s.growth.growthMonths,
        growthBloomMonths: s.growth.bloomMonths,
        growthFruitMonths: s.growth.fruitMonths,
        growthMinimumPrecipitation: s.growth.minimumPrecipitation.mm,
        growthMaximumPrecipitation: s.growth.maximumPrecipitation.mm,
        growthMinimumRootDepth: s.growth.minimumRootDepth.cm,
        growthMinimumTemperature: s.growth.minimumTemperature.degC,
        growthMaximumTemperature: s.growth.maximumTemperature.degC,
        growthSoilNutriments: s.growth.soilNutriments,
        growthSoilSalinity: s.growth.soilSalinity,
        growthSoilTexture: s.growth.soilTexture,
        growthSoilHumidity: s.growth.soilHumidity,
        divisionOrder: divisionOrder.value,
        divisionClass: divisionClass.value,
        division: division.value,
        subkingdom: subkingdom.value,
        kingdom: kingdom.value,
        date:DateTime.now().toString()
      ) );
      //_mapBoxes["species"].clear();
      Get.find<HomeController>().update();

    }
    catch(e){
      print(e);
    }
  }
}
