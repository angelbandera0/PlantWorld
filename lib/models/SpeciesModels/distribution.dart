class Distribution {
  List<String> nativa;
  List<String> introduced;

  Distribution({
    this.nativa,
    this.introduced,
  });
  Distribution.fromJsonMap(Map<String, dynamic> json) {
    nativa=_fromJsonList(json["native"]);
    introduced=_fromJsonList(json["introduced"]);
  }
  List<String> _fromJsonList(dynamic jsonList) {
    List<String> items=List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      final data = item;
      items.add(data);
    }
    return items;

  }
}
