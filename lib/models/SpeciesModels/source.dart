class Source {
  String lastUpdate;
  String id;
  String name;
  String url;
  String citation;

  Source({
    this.lastUpdate,
    this.id,
    this.name,
    this.url,
    this.citation,
  });

  Source.fromJsonMap(Map<String, dynamic> json) {
    lastUpdate=json["last_update"];
    id=json["id"];
    name=json["name"];
    url=json["url"];
    citation=json["citation"];
  }
}
