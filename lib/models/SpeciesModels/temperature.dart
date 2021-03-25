class Temperature {
  int degF;
  int degC;

  Temperature({
    this.degF,
    this.degC,
  });
  Temperature.fromJsonMap(Map<String, dynamic> json) {
    degF=json["deg_f"];
    degC=json["deg_c"];
  }
}
