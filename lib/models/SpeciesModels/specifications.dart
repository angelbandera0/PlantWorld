import 'package:myapp/models/SpeciesModels/medida.dart';

class Specifications {
  String ligneousType;
  String growthForm;
  String growthHabit;
  String growthRate;
  Medida averageHeight;
  Medida maximumHeight;
  String nitrogenFixation;
  String shapeAndOrientation;
  String toxicity;

  Specifications({
    this.ligneousType,
    this.growthForm,
    this.growthHabit,
    this.growthRate,
    this.averageHeight,
    this.maximumHeight,
    this.nitrogenFixation,
    this.shapeAndOrientation,
    this.toxicity,
  });
  Specifications.fromJsonMap(Map<String, dynamic> json) {
    ligneousType=json["ligneous_type"];
    growthForm=json["growth_form"];
    growthHabit=json["growth_habit"];
    growthRate=json["growth_rate"];
    averageHeight=Medida.fromJsonMap(json["average_height"]);
    maximumHeight=Medida.fromJsonMap(json["maximum_height"]);
    nitrogenFixation=json["nitrogen_fixation"];
    shapeAndOrientation=json["shape_and_orientation"];
    toxicity=json["toxicity"];
  }
}
