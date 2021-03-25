import 'package:myapp/models/SpeciesModels/source.dart';

class Synonym {
  int id;
  String name;
  String author;
  List<Source> sources;

  Synonym({
    this.id,
    this.name,
    this.author,
    this.sources,
  });
  Synonym.fromJsonMap(Map<String, dynamic> json) {
    id=json["id"];
    name=json["name"];
    author=json["author"];
    sources=_fromJsonList(json["sources"]);
  }
  List<Source> _fromJsonList(dynamic jsonList) {
    List<Source> items=List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      final data = new Source.fromJsonMap(item);
      items.add(data);
    }
    return items;

  }
}
