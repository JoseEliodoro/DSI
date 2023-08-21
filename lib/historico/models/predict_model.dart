import 'dart:convert';

class Predict {
  int aprDrgCode;
  int aprMdcCode;
  String aprMedicalSurgicalDescription;
  String aprRiskOfMortality;
  int aprSeverityOfIllnessCode;
  int abortionEditIndicator;
  int ageGroup;
  int attendingProviderLicenseNumber;
  int emergencyDepartmentIndicator;
  String ethnicity;
  String facilityName;
  String gender;
  String healthServiceArea;
  String hospitalCounty;
  int lengthOfStay;
  int operatingProviderLicenseNumber;
  String patientDisposition;
  String race;
  String sourceOfPayment1;
  String typeOfAdmission;

  

  Predict({
    required this.aprDrgCode,
    required this.aprMdcCode,
    required this.aprMedicalSurgicalDescription,
    required this.aprRiskOfMortality,
    required this.aprSeverityOfIllnessCode,
    required this.abortionEditIndicator,
    required this.ageGroup,
    required this.attendingProviderLicenseNumber,
    required this.emergencyDepartmentIndicator,
    required this.ethnicity,
    required this.facilityName,
    required this.gender,
    required this.healthServiceArea,
    required this.hospitalCounty,
    required this.lengthOfStay,
    required this.operatingProviderLicenseNumber,
    required this.patientDisposition,
    required this.race,
    required this.sourceOfPayment1,
    required this.typeOfAdmission,
  });

  factory Predict.fromJson(Map<String, dynamic> json) => Predict(
        aprDrgCode: json["APR DRG Code"],
        aprMdcCode: json["APR MDC Code"],
        aprMedicalSurgicalDescription: json["APR Medical Surgical Description"],
        aprRiskOfMortality: json["APR Risk of Mortality"],
        aprSeverityOfIllnessCode: json["APR Severity of Illness Code"],
        abortionEditIndicator: json["Abortion Edit Indicator"],
        ageGroup: json["Age Group"],
        attendingProviderLicenseNumber:
            json["Attending Provider License Number"],
        emergencyDepartmentIndicator: json["Emergency Department Indicator"],
        ethnicity: json["Ethnicity"],
        facilityName: json["Facility Name"],
        gender: json["Gender"],
        healthServiceArea: json["Health Service Area"],
        hospitalCounty: json["Hospital County"],
        lengthOfStay: json["Length of Stay"],
        operatingProviderLicenseNumber:
            json["Operating Provider License Number"],
        patientDisposition: json["Patient Disposition"],
        race: json["Race"],
        sourceOfPayment1: json["Source of Payment 1"],
        typeOfAdmission: json["Type of Admission"],
      );

  Map<String, dynamic> toJson() => {
        "APR DRG Code": aprDrgCode,
        "APR MDC Code": aprMdcCode,
        "APR Medical Surgical Description": aprMedicalSurgicalDescription,
        "APR Risk of Mortality": aprRiskOfMortality,
        "APR Severity of Illness Code": aprSeverityOfIllnessCode,
        "Abortion Edit Indicator": abortionEditIndicator,
        "Age Group": ageGroup,
        "Attending Provider License Number": attendingProviderLicenseNumber,
        "Emergency Department Indicator": emergencyDepartmentIndicator,
        "Ethnicity": ethnicity,
        "Facility Name": facilityName,
        "Gender": gender,
        "Health Service Area": healthServiceArea,
        "Hospital County": hospitalCounty,
        "Length of Stay": lengthOfStay,
        "Operating Provider License Number": operatingProviderLicenseNumber,
        "Patient Disposition": patientDisposition,
        "Race": race,
        "Source of Payment 1": sourceOfPayment1,
        "Type of Admission": typeOfAdmission,
      };
}
