import 'package:flutter/material.dart';
//import 'package:heal_anality/crudillness/models/illness.dart';
//import 'package:intl/intl.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

class BarSearch extends StatefulWidget {
  const BarSearch({super.key});

  @override
  State<BarSearch> createState() => _BarSearchState();
}

class _BarSearchState extends State<BarSearch> {
  late Future futuret;
  final name = TextEditingController();
  // ignore: non_constant_identifier_names
  final Illness = TextEditingController();
  final gender = TextEditingController();
  

  List chronicCondition = [];
  List allergy = [];
  List surgeries = [];
  List drugs = [];
  bool isChecked = false;
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
   

    
    List<String> conditions =[
    "BONE MARROW TRANSPLANT",
      "TRACHEOSTOMY W MV 96+ HOURS W EXTENSIVE PROCEDURE OR ECMO",
      "TRACHEOSTOMY W MV 96+ HOURS W/O EXTENSIVE PROCEDURE",
      "CRANIOTOMY EXCEPT FOR TRAUMA",
      "OTHER NERVOUS SYSTEM & RELATED PROCEDURES",
      "SPINAL DISORDERS & INJURIES",
      "MULTIPLE SCLEROSIS & OTHER DEMYELINATING DISEASES",
      "INTRACRANIAL HEMORRHAGE",
      "CVA & PRECEREBRAL OCCLUSION W INFARCT",
      "TRANSIENT ISCHEMIA",
      "PERIPHERAL, CRANIAL & AUTONOMIC NERVE DISORDERS",
      "NON-BACTERIAL INFECTIONS OF NERVOUS SYSTEM EXC VIRAL MENINGITIS",
      "SEIZURE",
      "MIGRAINE & OTHER HEADACHES",
      "HEAD TRAUMA W COMA >1 HR OR HEMORRHAGE",
      "CONCUSSION, CLOSED SKULL FX NOS,UNCOMPLICATED ",
      "INTRACRANIAL INJURY, COMA < 1 HR OR NO COMA",
      "OTHER EAR, NOSE, MOUTH & THROAT PROCEDURES",
      "EAR, NOSE, MOUTH, THROAT, CRANIAL/FACIAL MALIGNANCIES",
      "VERTIGO & OTHER LABYRINTH DISORDERS",
      "OTHER EAR, NOSE, MOUTH,THROAT & CRANIAL/FACIAL DIAGNOSES",
      "OTHER RESPIRATORY & CHEST PROCEDURES",
      "PULMONARY EDEMA & RESPIRATORY FAILURE",
      "MAJOR CHEST & RESPIRATORY TRAUMA",
      "RESPIRATORY MALIGNANCY",
      "MAJOR RESPIRATORY INFECTIONS & INFLAMMATIONS",
      "BRONCHIOLITIS & RSV PNEUMONIA",
      "OTHER PNEUMONIA",
      "CHRONIC OBSTRUCTIVE PULMONARY DISEASE",
      "ASTHMA",
      "OTHER RESPIRATORY DIAGNOSES EXCEPT SIGNS, SYMPTOMS",
      "Lúpus",
      "Hipotireoidismo",
      "RESPIRATORY SIGNS, SYMPTOMS & MINOR DIAGNOSES",
      "CARDIAC DEFIBRILLATOR & HEART ASSIST IMPLANT",
      "CARDIAC VALVE PROCEDURES W/O CARDIAC CATHETERIZATION",
      "CORONARY BYPASS W CARDIAC CATH ",
      "PERM CARDIAC PACEMAKER IMPLANT W/O AMI, HEART FAILURE",
      "OTHER VASCULAR PROCEDURES",
      "PERCUTANEOUS CARDIOVASCULAR PROCEDURES W AMI",
      "ACUTE MYOCARDIAL INFARCTION",
      "CARDIAC CATHETERIZATION W CIRC DISORD EXC ISCHEMIC HEART DISEAS",
      "HEART FAILURE",
      "ANGINA PECTORIS & CORONARY ATHEROSCLEROSIS",
      "HYPERTENSION",
      "CARDIAC STRUCTURAL & VALVULAR DISORDERS",
      "CHEST PAIN",
      "SYNCOPE & COLLAPSE",
      "OTHER CIRCULATORY SYSTEM DIAGNOSES)",
      "MAJOR SMALL & LARGE BOWEL PROCEDURES",
      "OTHER STOMACH, ESOPHAGEAL & DUODENAL PROCEDURES",
      "APPENDECTOMY",
      "ANAL PROCEDURES ",
      "HERNIA PROCEDURES EXCEPT INGUINAL, FEMORAL & UMBILICAL",
      "INGUINAL, FEMORAL & UMBILICAL HERNIA PROCEDURES",
      "OTHER DIGESTIVE SYSTEM & ABDOMINAL PROCEDURES",
      "DIGESTIVE MALIGNANCY",
      "PEPTIC ULCER & GASTRITIS",
      "OTHER ESOPHAGEAL DISORDERS inflamatória intestinal (DII)",
      "DIVERTICULITIS & DIVERTICULOSIS",
      "GASTROINTESTINAL VASCULAR INSUFFICIENCY",
      "INTESTINAL OBSTRUCTION",
      "MAJOR GASTROINTESTINAL & PERITONEAL INFECTIONS",
      "NON-BACTERIAL GASTROENTERITIS, NAUSEA & VOMITING",
      "ABDOMINAL PAIN",
      "OTHER & UNSPECIFIED GASTROINTESTINAL HEMORRHAGE",
      "OTHER DIGESTIVE SYSTEM DIAGNOSES",
      "MAJOR PANCREAS, LIVER & SHUNT PROCEDURES",
      "LAPAROSCOPIC CHOLECYSTECTOMY",
      "HEPATIC COMA & OTHER MAJOR ACUTE LIVER DISORDERS",
      "ALCOHOLIC LIVER DISEASE",
      "MALIGNANCY OF HEPATOBILIARY SYSTEM & PANCREAS",
      "DISORDERS OF PANCREAS EXCEPT MALIGNANCY",
      "DISORDERS OF GALLBLADDER & BILIARY TRACT",
      "HIP JOINT REPLACEMENT",
      "DIABETES",
      "SICKLE CELL ANEMIA CRISIS",
      "CHEMOTHERAPY",
      "VIRAL ILLNESS",
      "REHABILITATION",
      "THERAPY",
      "HIV W MAJOR HIV RELATED CONDITION",
      
    ];
    List<String> listAllergy = [
      "Menor",
      "Moderado",
      "Maior",
      "Extremo",

    ];
    List<String> listSurgeries = [
      "Cirurgico",
      "Medical",
      "Outro",
    ];
    List<String> listDrugs = [
      "Maconha",
      "Cocaína",
      "MDMA",
      "Anfetaminas",
      "LSD",
      "Cogumelos alucinógenos",
      "Opioides com prescrição",
      "Ketamina",
      "Poppers",
      "Crack",
      "Álcool",
      "Cigaro",
      "Antibióticos",
      "Psicotrópicos",
      "Outros",
    ];


    final List<Widget> pesquisaEstendida = [
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: TextFormField(
          controller: name,
          decoration: const InputDecoration(
            label: Text('Nome'),
          ),
        ),
      ),
    
      // Condições médicas crônicas
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: MultiSelectDialogField(
          title: const Text('Selecione:'),
          buttonText: const Text('Condições médicas crônicas'),
          selectedColor: const Color.fromRGBO(10, 175, 158, 1),
          onConfirm: (val) {
            chronicCondition = val;
          },
          items: conditions.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: const [],
        ),
      ),
      // Alergias
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: MultiSelectDialogField(
          title: const Text('Selecione:'),
          buttonText: const Text('Alergias'),
          selectedColor: const Color.fromRGBO(10, 175, 158, 1),
          onConfirm: (val) {
            allergy = val;
          },
          items: listAllergy.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: const [],
        ),
      ),
      // Cirurgias anteriores
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: MultiSelectDialogField(
          title: const Text('Selecione:'),
          buttonText: const Text('Cirurgias anteriores'),
          selectedColor: const Color.fromRGBO(10, 175, 158, 1),
          onConfirm: (val) {
            surgeries = val;
          },
          items: listSurgeries.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: const [],
        ),
      ),
      // Drogas
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: MultiSelectDialogField(
          title: const Text('Selecione:'),
          buttonText: const Text('Drogas'),
          selectedColor: const Color.fromRGBO(10, 175, 158, 1),
          onConfirm: (val) {
            drugs = val;
          },
          items: listDrugs.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: const [],
        ),
      ),
      // Plano
      Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: const Text('Possui Vicio?'),
            ),
          ],
        ),
      ),
      // Submit
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  isMore = !isMore;
                });
              },
              child: const Icon(Icons.expand_less),
            ),
            TextButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(10, 175, 158, 1),
                ),
              ),
              label: const Text(
                'Pesquisar',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Map<String, dynamic> pacient = {
                  "Name": name.text,
                  "illness": Illness.text,                
                  "Medical Conditions": chronicCondition,
                  "Allergies": allergy,
                  "Surgeries": surgeries,
                  "Drugs": drugs,
                  'Health Insurance': isChecked,
                };
                print(pacient);
              },
            ),
          ],
        ),
      ),
    ];
    final List<Widget> pesquisa = [
      Expanded(
        child: TextFormField(
          style: const TextStyle(fontSize: 15),
          decoration: const InputDecoration(
            labelText: 'Code',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Informe o Code!';
            } else if (value.length < 14) {
              return 'Code inválido';
            }
            return null;
          },
        ),
      ),
      TextButton(
        onPressed: () {
          setState(() {
            isMore = !isMore;
          });
        },
        child: const Icon(Icons.expand_more),
      ),
      TextButton.icon(
        onPressed: () {
          //print('oi');
        },
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
            Color.fromARGB(91, 10, 175, 158),
          ),
        ),
        icon: const Icon(Icons.search),
        label: const Text(
          'pesquisar',
          style: TextStyle(
            color: Color.fromRGBO(10, 175, 158, 1),
          ),
        ),
      ),
    ];
    return SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: isMore
              ? Column(
                  children: pesquisaEstendida,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 2, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: pesquisa,
                  ),
                )),
    );
  }
}
