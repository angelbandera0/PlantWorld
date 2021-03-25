class Medida {
  int cm;

  Medida({
    this.cm,
  });
  Medida.fromJsonMap(Map<String, dynamic> json) {
    cm=json["cm"];
  }
}
