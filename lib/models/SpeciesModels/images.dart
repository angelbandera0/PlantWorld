import 'package:myapp/models/SpeciesModels/photo.dart';

class Images {
  List<Photo> flower;
  List<Photo> leaf;
  List<Photo> habit;
  List<Photo> fruit;
  List<Photo> bark;
  List<Photo> other;

  Images({
    this.flower,
    this.leaf,
    this.habit,
    this.fruit,
    this.bark,
    this.other,
  });
  Images.fromJsonMap(Map<String, dynamic> json) {
    flower=_fromJsonListPhotos(json["flower"]);
    leaf=_fromJsonListPhotos(json["leaf"]);
    habit=_fromJsonListPhotos(json["habit"]);
    fruit=_fromJsonListPhotos(json["fruit"]);
    bark=_fromJsonListPhotos(json["bark"]);
    other=_fromJsonListPhotos(json["other"]);
  }

  List<Photo> _fromJsonListPhotos(dynamic jsonList) {
    List<Photo> items=List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      final data = new Photo.fromJsonMap(item);
      items.add(data);
    }
    return items;

  }

}

