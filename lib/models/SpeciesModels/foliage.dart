class Foliage {
  String texture;
  dynamic color;
  bool leafRetention;

  Foliage({
    this.texture,
    this.color,
    this.leafRetention,
  });
  Foliage.fromJsonMap(Map<String, dynamic> json) {
    texture=json["texture"];
    color=json["color"];
    leafRetention=json["leaf_retention"];
  }
}