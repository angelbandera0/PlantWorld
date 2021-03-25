import 'package:myapp/models/SpeciesModels/medida.dart';
import 'package:myapp/models/SpeciesModels/precipitation.dart';
import 'package:myapp/models/SpeciesModels/temperature.dart';

class Growth {
  dynamic description;
  dynamic sowing;
  dynamic daysToHarvest;
  Medida rowSpacing;
  Medida spread;
  double phMaximum;
  double phMinimum;
  double light;
  double atmosphericHumidity;
  dynamic growthMonths;
  dynamic bloomMonths;
  dynamic fruitMonths;
  Precipitation minimumPrecipitation;
  Precipitation maximumPrecipitation;
  Medida minimumRootDepth;
  Temperature minimumTemperature;
  Temperature maximumTemperature;
  double soilNutriments;
  double soilSalinity;
  double soilTexture;
  double soilHumidity;

  Growth({
    this.description,
    this.sowing,
    this.daysToHarvest,
    this.rowSpacing,
    this.spread,
    this.phMaximum,
    this.phMinimum,
    this.light,
    this.atmosphericHumidity,
    this.growthMonths,
    this.bloomMonths,
    this.fruitMonths,
    this.minimumPrecipitation,
    this.maximumPrecipitation,
    this.minimumRootDepth,
    this.minimumTemperature,
    this.maximumTemperature,
    this.soilNutriments,
    this.soilSalinity,
    this.soilTexture,
    this.soilHumidity,
  });
  Growth.fromJsonMap(Map<String, dynamic> json) {
    try {
      description = json["description"];
      sowing = json["sowing"];
      daysToHarvest = json["days_to_harvest"];

      rowSpacing = Medida.fromJsonMap(json["row_spacing"]);
      spread = Medida.fromJsonMap(json["spread"]);

      phMaximum = json["ph_maximum"];
      phMinimum = json["ph_minimum"];
      soilNutriments = (json["soil_nutriments"]!=null)?json["soil_nutriments"]*1.0:null;
      soilSalinity = (json["soil_salinity"]!=null)?json["soil_salinity"]*1.0:null;
      soilTexture = (json["soil_texture"]!=null)?json["soil_texture"]*1.0:null;
      soilHumidity = (json["soil_humidity"]!=null)?json["soil_humidity"]*1.0:null;
      light=(json["light"]!=null)?json["light"]*1.0:null;
      atmosphericHumidity=(json["atmospheric_humidity"]!=null)?json["atmospheric_humidity"]*1.0:null;
      growthMonths=json["growth_months"];
      bloomMonths=json["bloom_months"];
      fruitMonths=json["fruit_months"];
      minimumPrecipitation=Precipitation.fromJsonMap(json["minimum_precipitation"]);
      maximumPrecipitation=Precipitation.fromJsonMap(json["maximum_precipitation"]);
      minimumRootDepth=Medida.fromJsonMap(json["minimum_root_depth"]);
      minimumTemperature=Temperature.fromJsonMap(json["minimum_temperature"]);
      maximumTemperature=Temperature.fromJsonMap(json["maximum_temperature"]);

    }
    catch(e){
      print(e.toString()+"fdxf");
    }
  }
}
