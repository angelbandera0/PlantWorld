// Generated by https://quicktype.io

class ListKingdom {
  List<Kingdom> items = new List();

  ListKingdom();

  ListKingdom.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final kingdom = Kingdom.fromJsonMap(item);
      items.add(kingdom);
    }
  }
}

class Kingdom {
  int id;
  String name;
  String slug;
  KingdomLinks links;

  Kingdom({
    this.id,
    this.name,
    this.slug,
    this.links,
  });

  Kingdom.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    links = KingdomLinks.fromJsonMap(json['links']);
  }
}

class KingdomLinks {
  String self;

  KingdomLinks({
    this.self,
  });
  KingdomLinks.fromJsonMap(Map<String, dynamic> json) {
    self = json['self'];
  }
}