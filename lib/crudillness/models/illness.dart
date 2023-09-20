class Illness {
  String code;
  String description;
  String risk;
  String servity;
  String surgical;
  String id;

  Illness({
    required this.code,
    required this.description,
    required this.risk,
    required this.servity,
    required this.surgical,
    required this.id,
  });

  factory Illness.fromJson(Map<String, dynamic> json) => Illness(
        code: json["Code"],
        description: json["Description"],
        risk: json["Risk"],
        servity: json["Servity"],
        surgical: json["Surgical"],
        id: json["Id"],
      );

  Map getValues() {
    return {
      "Code": code,
      "Desc": description,
      "Risk": risk,
      "Servity": servity,
      "Surgical": surgical,
      "Id": id,
    };
  }
}
