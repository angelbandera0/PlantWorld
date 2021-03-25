import 'package:hive/hive.dart';

part 'speciesOfflineHive.g.dart';

@HiveType(typeId: 0)
class SpeciesOfflineHive {
  @HiveField(0)
  int id;
  @HiveField(1)
  String commonName;
  @HiveField(2)
  String slug;
  @HiveField(3)
  String scientificName;
  @HiveField(4)
  int year;
  @HiveField(5)
  String bibliography;
  @HiveField(6)
  String author;
  @HiveField(7)
  String status;
  @HiveField(8)
  String rank;
  @HiveField(9)
  String familyCommonName;
  @HiveField(10)
  int genusId;
  @HiveField(11)
  String observations;
  @HiveField(12)
  bool vegetable;
  @HiveField(13)
  String imageUrl;
  @HiveField(14)
  String genus;
  @HiveField(15)
  String family;
  @HiveField(16)
  dynamic duration;
  @HiveField(17)
  dynamic ediblePart;
  @HiveField(18)
  bool edible;
  @HiveField(19)
  dynamic flowerColor;
  @HiveField(20)
  bool flowerConspicuous;
  @HiveField(21)
  String foliageTexture;
  @HiveField(22)
  String foliageColor;
  @HiveField(23)
  bool foliageLeafRetention;
  @HiveField(24)
  bool fruitOrSeedConspicuous;
  @HiveField(25)
  dynamic fruitOrSeedColor;
  @HiveField(26)
  dynamic fruitOrSeedShape;
  @HiveField(27)
  bool fruitOrSeedSeedPersistence;
  @HiveField(28)
  String specificationsLigneousType;
  @HiveField(29)
  String specificationsGrowthForm;
  @HiveField(30)
  String specificationsGrowthHabit;
  @HiveField(31)
  String specificationsGrowthRate;
  @HiveField(32)
  int specificationsAverageHeight;
  @HiveField(33)
  int specificationsMaximumHeight;
  @HiveField(34)
  String specificationsNitrogenFixation;
  @HiveField(35)
  String specificationsShapeAndOrientation;
  @HiveField(36)
  String specificationsToxicity;
  @HiveField(37)
  dynamic growthDescription;
  @HiveField(38)
  dynamic growthSowing;
  @HiveField(39)
  dynamic growthDaysToHarvest;
  @HiveField(40)
  int growthRowSpacing;
  @HiveField(41)
  int growthSpread;
  @HiveField(42)
  double growthPhMaximum;
  @HiveField(43)
  double growthPhMinimum;
  @HiveField(44)
  double growthLight;
  @HiveField(45)
  double growthAtmosphericHumidity;
  @HiveField(46)
  dynamic growthGrowthMonths;
  @HiveField(47)
  dynamic growthBloomMonths;
  @HiveField(48)
  dynamic growthFruitMonths;
  @HiveField(49)
  int growthMinimumPrecipitation;
  @HiveField(50)
  int growthMaximumPrecipitation;
  @HiveField(51)
  int growthMinimumRootDepth;
  @HiveField(52)
  int growthMinimumTemperature;
  @HiveField(53)
  int growthMaximumTemperature;
  @HiveField(54)
  double growthSoilNutriments;
  @HiveField(55)
  double growthSoilSalinity;
  @HiveField(56)
  double growthSoilTexture;
  @HiveField(57)
  double growthSoilHumidity;
  @HiveField(58)
  String divisionOrder;
  @HiveField(59)
  String divisionClass;
  @HiveField(60)
  String division;
  @HiveField(61)
  String subkingdom;
  @HiveField(62)
  String kingdom;
  @HiveField(63)
  String date;

  SpeciesOfflineHive(
      {this.id,
      this.commonName,
      this.slug,
      this.scientificName,
      this.year,
      this.bibliography,
      this.author,
      this.status,
      this.rank,
      this.familyCommonName,
      this.genusId,
      this.observations,
      this.vegetable,
      this.imageUrl,
      this.genus,
      this.family,
      this.duration,
      this.ediblePart,
      this.edible,
      this.flowerColor,
      this.flowerConspicuous,
      this.foliageTexture,
      this.foliageColor,
      this.foliageLeafRetention,
      this.fruitOrSeedConspicuous,
      this.fruitOrSeedColor,
      this.fruitOrSeedShape,
      this.fruitOrSeedSeedPersistence,
      this.specificationsLigneousType,
      this.specificationsGrowthForm,
      this.specificationsGrowthHabit,
      this.specificationsGrowthRate,
      this.specificationsAverageHeight,
      this.specificationsMaximumHeight,
      this.specificationsNitrogenFixation,
      this.specificationsShapeAndOrientation,
      this.specificationsToxicity,
      this.growthDescription,
      this.growthSowing,
      this.growthDaysToHarvest,
      this.growthRowSpacing,
      this.growthSpread,
      this.growthPhMaximum,
      this.growthPhMinimum,
      this.growthLight,
      this.growthAtmosphericHumidity,
      this.growthGrowthMonths,
      this.growthBloomMonths,
      this.growthFruitMonths,
      this.growthMinimumPrecipitation,
      this.growthMaximumPrecipitation,
      this.growthMinimumRootDepth,
      this.growthMinimumTemperature,
      this.growthMaximumTemperature,
      this.growthSoilNutriments,
      this.growthSoilSalinity,
      this.growthSoilTexture,
      this.growthSoilHumidity,
      this.divisionOrder,
      this.divisionClass,
      this.division,
      this.subkingdom,
      this.kingdom,
      this.date});
}
