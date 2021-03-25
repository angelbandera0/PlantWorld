class FruitOrSeed {
  bool conspicuous;
  dynamic color;
  dynamic shape;
  bool seedPersistence;

  FruitOrSeed({
    this.conspicuous,
    this.color,
    this.shape,
    this.seedPersistence,
  });
  FruitOrSeed.fromJsonMap(Map<String, dynamic> json) {
    conspicuous=json["conspicuous"];
    color=json["color"];
    shape=json["shape"];
    seedPersistence=json["seed_persistence"];
  }
}
