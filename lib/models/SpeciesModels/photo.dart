class Photo {
  int id;
  String imageUrl;
  String copyright;

  Photo({
    this.id,
    this.imageUrl,
    this.copyright,
  });
  Photo.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    imageUrl = json["image_url"];
    copyright = json["copyright"];
  }
}
