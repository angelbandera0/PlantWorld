import 'package:myapp/models/distribution_data.dart';

class Distributions {
  List<DistributionData> nativa;
  List<DistributionData> introduced;

  Distributions({
    this.nativa,
    this.introduced,
  });
  Distributions.fromJsonMap(Map<String, dynamic> json) {
    nativa=_fromJsonList(json["native"]);
    introduced=_fromJsonList(json["introduced"]);
  }
  List<DistributionData> _fromJsonList(dynamic jsonList) {
    List<DistributionData> items=List();
    if (jsonList == null) return List();

    for (var item in jsonList) {
      final data = DistributionData.fromJsonMap(item);
      items.add(data);
    }
    return items;

  }
}
