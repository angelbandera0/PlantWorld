// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciesOfflineHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpeciesOfflineHiveAdapter extends TypeAdapter<SpeciesOfflineHive> {
  @override
  final int typeId = 0;

  @override
  SpeciesOfflineHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpeciesOfflineHive(
      id: fields[0] as int,
      commonName: fields[1] as String,
      slug: fields[2] as String,
      scientificName: fields[3] as String,
      year: fields[4] as int,
      bibliography: fields[5] as String,
      author: fields[6] as String,
      status: fields[7] as String,
      rank: fields[8] as String,
      familyCommonName: fields[9] as String,
      genusId: fields[10] as int,
      observations: fields[11] as String,
      vegetable: fields[12] as bool,
      imageUrl: fields[13] as String,
      genus: fields[14] as String,
      family: fields[15] as String,
      duration: fields[16] as dynamic,
      ediblePart: fields[17] as dynamic,
      edible: fields[18] as bool,
      flowerColor: fields[19] as dynamic,
      flowerConspicuous: fields[20] as bool,
      foliageTexture: fields[21] as String,
      foliageColor: fields[22] as String,
      foliageLeafRetention: fields[23] as bool,
      fruitOrSeedConspicuous: fields[24] as bool,
      fruitOrSeedColor: fields[25] as dynamic,
      fruitOrSeedShape: fields[26] as dynamic,
      fruitOrSeedSeedPersistence: fields[27] as bool,
      specificationsLigneousType: fields[28] as String,
      specificationsGrowthForm: fields[29] as String,
      specificationsGrowthHabit: fields[30] as String,
      specificationsGrowthRate: fields[31] as String,
      specificationsAverageHeight: fields[32] as int,
      specificationsMaximumHeight: fields[33] as int,
      specificationsNitrogenFixation: fields[34] as String,
      specificationsShapeAndOrientation: fields[35] as String,
      specificationsToxicity: fields[36] as String,
      growthDescription: fields[37] as dynamic,
      growthSowing: fields[38] as dynamic,
      growthDaysToHarvest: fields[39] as dynamic,
      growthRowSpacing: fields[40] as int,
      growthSpread: fields[41] as int,
      growthPhMaximum: fields[42] as double,
      growthPhMinimum: fields[43] as double,
      growthLight: fields[44] as double,
      growthAtmosphericHumidity: fields[45] as double,
      growthGrowthMonths: fields[46] as dynamic,
      growthBloomMonths: fields[47] as dynamic,
      growthFruitMonths: fields[48] as dynamic,
      growthMinimumPrecipitation: fields[49] as int,
      growthMaximumPrecipitation: fields[50] as int,
      growthMinimumRootDepth: fields[51] as int,
      growthMinimumTemperature: fields[52] as int,
      growthMaximumTemperature: fields[53] as int,
      growthSoilNutriments: fields[54] as double,
      growthSoilSalinity: fields[55] as double,
      growthSoilTexture: fields[56] as double,
      growthSoilHumidity: fields[57] as double,
      divisionOrder: fields[58] as String,
      divisionClass: fields[59] as String,
      division: fields[60] as String,
      subkingdom: fields[61] as String,
      kingdom: fields[62] as String,
      date: fields[63] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpeciesOfflineHive obj) {
    writer
      ..writeByte(64)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.commonName)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.scientificName)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.bibliography)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.rank)
      ..writeByte(9)
      ..write(obj.familyCommonName)
      ..writeByte(10)
      ..write(obj.genusId)
      ..writeByte(11)
      ..write(obj.observations)
      ..writeByte(12)
      ..write(obj.vegetable)
      ..writeByte(13)
      ..write(obj.imageUrl)
      ..writeByte(14)
      ..write(obj.genus)
      ..writeByte(15)
      ..write(obj.family)
      ..writeByte(16)
      ..write(obj.duration)
      ..writeByte(17)
      ..write(obj.ediblePart)
      ..writeByte(18)
      ..write(obj.edible)
      ..writeByte(19)
      ..write(obj.flowerColor)
      ..writeByte(20)
      ..write(obj.flowerConspicuous)
      ..writeByte(21)
      ..write(obj.foliageTexture)
      ..writeByte(22)
      ..write(obj.foliageColor)
      ..writeByte(23)
      ..write(obj.foliageLeafRetention)
      ..writeByte(24)
      ..write(obj.fruitOrSeedConspicuous)
      ..writeByte(25)
      ..write(obj.fruitOrSeedColor)
      ..writeByte(26)
      ..write(obj.fruitOrSeedShape)
      ..writeByte(27)
      ..write(obj.fruitOrSeedSeedPersistence)
      ..writeByte(28)
      ..write(obj.specificationsLigneousType)
      ..writeByte(29)
      ..write(obj.specificationsGrowthForm)
      ..writeByte(30)
      ..write(obj.specificationsGrowthHabit)
      ..writeByte(31)
      ..write(obj.specificationsGrowthRate)
      ..writeByte(32)
      ..write(obj.specificationsAverageHeight)
      ..writeByte(33)
      ..write(obj.specificationsMaximumHeight)
      ..writeByte(34)
      ..write(obj.specificationsNitrogenFixation)
      ..writeByte(35)
      ..write(obj.specificationsShapeAndOrientation)
      ..writeByte(36)
      ..write(obj.specificationsToxicity)
      ..writeByte(37)
      ..write(obj.growthDescription)
      ..writeByte(38)
      ..write(obj.growthSowing)
      ..writeByte(39)
      ..write(obj.growthDaysToHarvest)
      ..writeByte(40)
      ..write(obj.growthRowSpacing)
      ..writeByte(41)
      ..write(obj.growthSpread)
      ..writeByte(42)
      ..write(obj.growthPhMaximum)
      ..writeByte(43)
      ..write(obj.growthPhMinimum)
      ..writeByte(44)
      ..write(obj.growthLight)
      ..writeByte(45)
      ..write(obj.growthAtmosphericHumidity)
      ..writeByte(46)
      ..write(obj.growthGrowthMonths)
      ..writeByte(47)
      ..write(obj.growthBloomMonths)
      ..writeByte(48)
      ..write(obj.growthFruitMonths)
      ..writeByte(49)
      ..write(obj.growthMinimumPrecipitation)
      ..writeByte(50)
      ..write(obj.growthMaximumPrecipitation)
      ..writeByte(51)
      ..write(obj.growthMinimumRootDepth)
      ..writeByte(52)
      ..write(obj.growthMinimumTemperature)
      ..writeByte(53)
      ..write(obj.growthMaximumTemperature)
      ..writeByte(54)
      ..write(obj.growthSoilNutriments)
      ..writeByte(55)
      ..write(obj.growthSoilSalinity)
      ..writeByte(56)
      ..write(obj.growthSoilTexture)
      ..writeByte(57)
      ..write(obj.growthSoilHumidity)
      ..writeByte(58)
      ..write(obj.divisionOrder)
      ..writeByte(59)
      ..write(obj.divisionClass)
      ..writeByte(60)
      ..write(obj.division)
      ..writeByte(61)
      ..write(obj.subkingdom)
      ..writeByte(62)
      ..write(obj.kingdom)
      ..writeByte(63)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeciesOfflineHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
