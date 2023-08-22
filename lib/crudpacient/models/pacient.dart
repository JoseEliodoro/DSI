class Pacient {
  String name;
  String birthDay;
  String gender;
  String phone;
  List chronicCondition;
  List allergy;
  List surgeries;
  List drugs;
  String cpf;
  bool healthInsurance;
  String id;

  Pacient({
    required this.name,
    required this.birthDay,
    required this.gender,
    required this.phone,
    required this.chronicCondition,
    required this.allergy,
    required this.surgeries,
    required this.drugs,
    required this.cpf,
    required this.healthInsurance,
    required this.id,
  });

  factory Pacient.fromJson(Map<String, dynamic> json) => Pacient(
        name: json["Name"],
        birthDay: json["Birth day"],
        gender: json["Gender"],
        phone: json["Phone"],
        chronicCondition: json["Medical Conditions"] ?? [],
        allergy: json["Allergies"] ?? [],
        surgeries: json["Surgeries"] ?? [],
        drugs: json["Drugs"] ?? [],
        cpf: json["CPF"],
        healthInsurance: json["Health Insurance"],
        id: json["Id"],
      );

  Map getValues() {
    return {
      "Name": name,
      "Birth day": birthDay,
      "Gender": gender,
      "Phone": phone,
      "Medical Conditions": chronicCondition,
      "Allergies": allergy,
      "Surgeries": surgeries,
      "Drugs": drugs,
      "CPF": cpf,
      "Health Insurance": healthInsurance,
      "Id": id,
    };
  }
}
