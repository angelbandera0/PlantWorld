class Flower {
  dynamic color;
  bool conspicuous;

  Flower({
    this.color,
    this.conspicuous,
  });
  Flower.fromJsonMap(Map<String, dynamic> json) {
    color = json["color"];
    conspicuous=json["conspicuous"];
  }
}
