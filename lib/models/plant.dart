// Generated by https://quicktype.io

import 'package:myapp/models/SpeciesModels/source.dart';
import 'package:myapp/models/family.dart';
import 'package:myapp/models/genus.dart';
import 'package:myapp/models/species.dart';

class ListPlant {
  List<Plant> items = new List();
  ListPlantLinks links;
  MetaData meta;
  ListPlant();

  ListPlant.fromJsonList(dynamic jsonList) {
    if (jsonList == null) return;

    print(jsonList['links']);
    links = ListPlantLinks.fromJsonMap(jsonList['links']);
    meta = MetaData.fromJsonMap(jsonList['meta']);
    for (var item in jsonList['data']) {
      final data = new Plant.fromJsonMap(item);
      items.add(data);
    }

  }
}

class MetaData {
  int total;

  MetaData(this.total);
  MetaData.fromJsonMap(Map<String, dynamic> json) {
    total = json['total'];
  }
}

class Plant {
  int id;
  dynamic commonName;
  String slug;
  String scientificName;
  int mainSpeciesId;
  dynamic imageUrl;
  int year;
  String bibliography;
  String author;
  String familyCommonName;
  int genusId;
  String observations;
  bool vegetable;
  PlantLinks links;
  Species mainSpecies;
  Genus genus;
  Family family;
  List<Species> species;
  List<dynamic> subspecies;
  List<dynamic> varieties;
  List<dynamic> hybrids;
  List<dynamic> forms;
  List<dynamic> subvarieties;
  List<Source> sources;

  Plant({
    this.id,
    this.commonName,
    this.slug,
    this.scientificName,
    this.mainSpeciesId,
    this.imageUrl,
    this.year,
    this.bibliography,
    this.author,
    this.familyCommonName,
    this.genusId,
    this.observations,
    this.vegetable,
    this.links,
    this.mainSpecies,
    this.genus,
    this.family,
    this.species,
    this.subspecies,
    this.varieties,
    this.hybrids,
    this.forms,
    this.subvarieties,
    this.sources,
  });
  Plant.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    slug = json['slug'];
    scientificName = json['scientific_name'];
    mainSpeciesId = json['main_species_id'];
    imageUrl    = json['image_url'];
    year        = json['year'];
    bibliography = json['bibliography'];
    author      = json['author'];
    familyCommonName = json['family_common_name'];
    genusId     = json['genus_id'];
    observations = json['observations'];
    vegetable   = json['vegetable'];
    links       = PlantLinks.fromJsonMap(json['links']);
    mainSpecies = null;//Species.fromJsonMap(json['main_species']);
    genus       = null;//Genus.fromJsonMap(json['main_species']); //json['genus'];
    family      = null;//Family.fromJsonMap(json['family']);
    species     = null;
    subspecies  = null;//.fromJsonMap(json['subspecies']);
    varieties   = null;//.fromJsonMap(json['varieties']);
    hybrids     = null;//.fromJsonMap(json['hybrids']);
    forms       = null;//.fromJsonMap(json['forms']);
    subvarieties= null;//.fromJsonMap(json['subvarieties']);
    sources     = null;//.fromJsonMap(json['sources']);
    //links = DivisionLinks.fromJsonMap(json['links']);
    //subkingdom =  SubKingdom.fromJsonMap(json['subkingdom']);
  }
}

class PlantLinks {
  String self;
  String species;
  String genus;

  PlantLinks({this.self, this.species, this.genus});
  PlantLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    species = json['species'];
    genus = json['genus'];
  }
}

class ListPlantLinks {
  String self;
  String first;
  String last;

  ListPlantLinks({this.self, this.first, this.last});
  ListPlantLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    last = json['last'];
  }
}