// Generated by https://quicktype.io

import 'package:myapp/models/family.dart';

class ListGenus {
  List<Genus> items = [];
  ListGenusLinks links;
  MetaData meta;
  ListGenus();

  ListGenus.fromJsonList(dynamic jsonList) {
    if (jsonList == null) return;

    links = ListGenusLinks.fromJsonMap(jsonList['links']);
    meta = MetaData.fromJsonMap(jsonList['meta']);
    for (var item in jsonList['data']) {
      final data = new Genus.fromJsonMap(item);
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



class Genus {
  int id;
  String name;
  String slug;
  GenusLinks links;
  Family family;

  Genus({
    this.id,
    this.name,
    this.slug,
    this.links,
    this.family,
  });
  Genus.fromJsonMap(Map<String, dynamic> json) {
    id = json['id']!=null?json['id']:null;
    name = json['name']!=null?json['name']:null;
    slug = json['slug']!=null?json['slug']:null;
    links = json['links']!=null?GenusLinks.fromJsonMap(json['links']):null;
    family = json['family']!=null?Family.fromJsonMap(json['family']):null;
  }
}

class GenusLinks {
  String self;
  String plants;
  String species;
  String family;

  GenusLinks({
    this.self,
    this.plants,
    this.species,
    this.family,
  });
  GenusLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    species = json['species'];
    plants = json['plants'];
    family = json['family'];
  }
}

class ListGenusLinks {
  String self;
  String first;
  String last;
  String next;
  String prev;

  ListGenusLinks({this.self, this.first, this.last});
  ListGenusLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    last = json['last'];
    next = json['next'];
    prev = json['prev'];
  }
}
