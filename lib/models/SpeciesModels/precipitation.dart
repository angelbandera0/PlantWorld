class Precipitation {
  int mm;

  Precipitation({
    this.mm,
  });
  Precipitation.fromJsonMap(Map<String, dynamic> json) {
    mm=json["mm"];
  }
}
