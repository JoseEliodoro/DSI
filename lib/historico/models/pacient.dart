class Pacient {
  String area;
  String condado;
  String nomeHospital;
  int ageGroup;
  String gender;
  String race;
  String ethnicity;
  int stay;
  String admission;
  String disposition;
  int aprDrgCode;
  int aprMdcCode;
  int severity;
  String riskMortality;
  String medicalDescription;
  String patyment;
  double attending;
  double operating;
  int aborttion;
  int emergency;
  String cost;

  Pacient({
    required this.area,
    required this.condado,
    required this.nomeHospital,
    required this.ageGroup,
    required this.gender,
    required this.race,
    required this.ethnicity,
    required this.stay,
    required this.admission,
    required this.disposition,
    required this.aprDrgCode,
    required this.aprMdcCode,
    required this.severity,
    required this.riskMortality,
    required this.medicalDescription,
    required this.patyment,
    required this.attending,
    required this.operating,
    required this.aborttion,
    required this.emergency,
    required this.cost,
  });
  Map getValues() {
    String age = '';
    String severityIllness = '';
    String genero = '';
    switch (ageGroup) {
      case 0:
        age = '0 a 17';
        break;
      case 1:
        age = '18 a 29';
        break;
      case 2:
        age = '30 a 49';
        break;
      case 3:
        age = '50 a 69';
        break;
      case 4:
        age = 'mais de 70';
        break;
    }

    switch (severity) {
      case 1:
        severityIllness = 'Minor';
        break;
      case 2:
        severityIllness = 'Moderate';
        break;
      case 3:
        severityIllness = 'Major';
        break;
      case 4:
        severityIllness = 'Extreme';
        break;
    }
    switch (gender) {
      case "M":
        genero = 'Masculino';
        break;
      case 'F':
        genero = 'Feminino';
        break;
      case "U":
        genero = 'Outro';
        break;
    }

    return {
      "Health Service Area": area,
      "Hospital County": condado,
      "Facility Name": nomeHospital,
      "Age Group": age,
      "Gender": genero,
      "Race": race,
      "Ethnicity": ethnicity,
      "Length of Stay": stay,
      "Type of Admission": admission,
      "Patient Disposition": disposition,
      "APR DRG Code": aprDrgCode,
      "APR MDC Code": aprMdcCode,
      "APR Severity of Illness Code": severityIllness,
      "APR Risk of Mortality": riskMortality,
      "APR Medical Surgical Description": medicalDescription,
      "Source of Payment 1": patyment,
      "Attending Provider License Number": attending,
      "Operating Provider License Number": operating,
      "Abortion Edit Indicator": aborttion == 0 ? "False" : "True",
      "Emergency Department Indicator": emergency == 0 ? "False" : "True",
      "Total Cost Category": cost,
    };
  }
}
