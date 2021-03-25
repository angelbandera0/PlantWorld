// Generated by https://quicktype.io


import 'package:myapp/models/SpeciesModels/distribution.dart';
import 'package:myapp/models/SpeciesModels/distributions.dart';
import 'package:myapp/models/SpeciesModels/flower.dart';
import 'package:myapp/models/SpeciesModels/foliage.dart';
import 'package:myapp/models/SpeciesModels/fruit_or_seed.dart';
import 'package:myapp/models/SpeciesModels/growth.dart';
import 'package:myapp/models/SpeciesModels/images.dart';
import 'package:myapp/models/SpeciesModels/source.dart';
import 'package:myapp/models/SpeciesModels/specifications.dart';
import 'package:myapp/models/SpeciesModels/synonym.dart';

class ListSpecies {
  List<Species> items = new List();
  ListSpeciesLinks links;
  MetaData meta;
  ListSpecies();

  ListSpecies.fromJsonList(dynamic jsonList) {
    if (jsonList == null) return;

    print(jsonList['links']);
    links = ListSpeciesLinks.fromJsonMap(jsonList['links']);
    meta = MetaData.fromJsonMap(jsonList['meta']);
    for (var item in jsonList['data']) {
      final data = new Species.fromJsonMap(item);
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

class Species {
  int id;
  String commonName;
  String slug;
  String scientificName;
  int year;
  String bibliography;
  String author;
  String status;
  String rank;
  String familyCommonName;
  int genusId;
  String observations;
  bool vegetable;
  String imageUrl;
  String genus;
  String family;
  dynamic duration;
  dynamic ediblePart;
  bool edible;
  Images images;
  Map<String, List<String>> commonNames;
  Distribution distribution;
  Distributions distributions;
  Flower flower;
  Foliage foliage;
  FruitOrSeed fruitOrSeed;
  Specifications specifications;
  Growth growth;
  SpeciesLinks links;
  List<Synonym> synonyms;
  List<Source> sources;

  Species({
    this.id,
    this.commonName,
    this.slug,
    this.scientificName,
    this.year,
    this.bibliography,
    this.author,
    this.status,
    this.rank,
    this.familyCommonName,
    this.genusId,
    this.observations,
    this.vegetable,
    this.imageUrl,
    this.genus,
    this.family,
    this.duration,
    this.ediblePart,
    this.edible,
    this.images,
    this.commonNames,
    this.distribution,
    this.distributions,
    this.flower,
    this.foliage,
    this.fruitOrSeed,
    this.specifications,
    this.growth,
    this.links,
    this.synonyms,
    this.sources,
  });
  Species.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    commonName = json["common_name"];
    slug = json["slug"];
    scientificName = json["scientific_name"];
    year = json["year"];
    bibliography = json["bibliography"];
    author = json["author"];
    status = json["status"];
    rank = json["rank"];
    familyCommonName = json["family_common_name"];
    genusId = json["genusId"];
    observations = json["observations"];
    vegetable = json["vegetable"];
    imageUrl = json["image_url"];
    genus = json["genus"];
    family = json["family"];
    duration = json["duration"];
    ediblePart = json["ediblePart"];
    edible = json["edible"];

    images = (json["images"] != null) ? Images.fromJsonMap(json["images"]) : null;

    commonNames = null; //json["common_names"];
    distribution =(json["distribution"] != null) ? Distribution.fromJsonMap(json["distribution"]) : null;

    distributions = (json["distributions"] != null) ?Distributions.fromJsonMap(json["distributions"]) : null;
    flower =(json["flower"] != null) ? Flower.fromJsonMap(json["flower"]) : null;

    foliage =(json["foliage"] != null) ? Foliage.fromJsonMap(json["foliage"]) : null;
    fruitOrSeed =(json["fruit_or_seed"] != null) ? FruitOrSeed.fromJsonMap(json["fruit_or_seed"]) : null;

    specifications =(json["specifications"] != null) ? Specifications.fromJsonMap(json["specifications"]) : null;
    growth =(json["growth"] != null) ? Growth.fromJsonMap(json["growth"]) : null;

    links =(json["links"] != null) ? SpeciesLinks.fromJsonMap(json["links"]) : null;
    synonyms =(json["synonyms"] != null) ? _fromJsonListToListSynonym(json["synonyms"]) : null;
    sources =(json["sources"] != null) ? _fromJsonListToListSource(json["sources"]) : null;

  }
  List<Synonym> _fromJsonListToListSynonym(dynamic jsonList) {
    List<Synonym> items = List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      if(!(item is String)) {
        final data = new Synonym.fromJsonMap(item as Map<String,dynamic>);
        items.add(data);
      }
    }
    return items;
  }

  List<Source> _fromJsonListToListSource(dynamic jsonList) {
    List<Source> items = List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      final data = new Source.fromJsonMap(item);
      items.add(data);
    }
    return items;
  }
}

class SpeciesLinks {
  String self;
  String plant;
  String genus;

  SpeciesLinks({
    this.self,
    this.plant,
    this.genus,
  });
  SpeciesLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    plant = json['plant'];
    genus = json['genus'];
  }
}

class ListSpeciesLinks {
  String self;
  String first;
  String last;
  String next;
  String prev;

  ListSpeciesLinks({this.self, this.first, this.last});
  ListSpeciesLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }
}
