import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/custom_drawer.dart';
import '../services/auth_service.dart';
import '../widgets/buttons_menu.dart';
import '../widgets/custom_appbar.dart';

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:http/http.dart' as http;

class AddPacientPage extends StatefulWidget {
  const AddPacientPage({super.key});

  @override
  State<AddPacientPage> createState() => _AddPacientPageState();
}

class _AddPacientPageState extends State<AddPacientPage> {
  late Future futuret;
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final birthDay = TextEditingController();
  final gender = TextEditingController();
  final phone = TextEditingController();
  final cpf = TextEditingController();

  List chronicCondition = [];
  List allergy = [];
  List surgeries = [];
  List drugs = [];
  bool isChecked = false;
  @override
  void initState() {
    gender.text = 'Masculino';
    super.initState();
  }

  POST(String user, Map paciente) async {
    String link =
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$user/pacients/.json';
    final response = await http.post(
      Uri.parse(link),
      body: json.encode(paciente),
    );
  }


  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    List<String> listGender = ['Masculino', 'Feminino', 'Outro'];
    List<String> conditions = [
      "Hipertensão arterial",
      "Diabetes tipo 2",
      "Doença cardíaca coronária",
      "Obesidade",
      "Asma",
      "Artrite",
      "Depressão",
      "Doença pulmonar obstrutiva crônica (DPOC)",
      "Doença renal crônica",
      "Doença de Alzheimer",
      "Artrite reumatoide",
      "Fibromialgia",
      "Hipotireoidismo",
      "Doença inflamatória intestinal (DII)",
      "Esquizofrenia",
      "Epilepsia",
      "Lúpus"
    ];
    List<String> listAllergy = [
      "Alergia ao pólen",
      "Alergia a poeira e ácaros",
      "Alergia a mofo",
      "Alergia a gato",
      "Alergia a cachorro",
      "Alergia a abelha",
      "Alergia a mosquito",
      "Alergia a alimentos, Alergia a medicamentos",
      "Alergia a látex, Alergia a produtos químicos",
      "Alergia a alimentos específicos",
    ];
    List<String> listSurgeries = [
      "Hérnia umbilical",
      "Hérnia inguinal",
      "Hidrocele",
      "Fimose",
      "Criptorquidia",
      "Hipospádia",
      "Timpanoplastia",
      "Estapedectomia – Otosclerose",
      "Mastoidectomia",
      "Adenóide",
      "Rinoplastia",
      "Otoplastia",
      "Amígdalas",
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

    var maskFormatter = MaskTextInputFormatter(
      mask: '(##) 9####-####',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );

    post(pacient) {
      POST('${auth.usuario?.uid}', pacient);
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          //const ButtonsMenu(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(237, 237, 237, 1),
              ),
              width: double.infinity,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Nome
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            label: Text('Nome Completo'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o nome do paciente!';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Data de nascimento e gênero
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: TextFormField(
                                controller: birthDay,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a data de nascimento!';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Row(
                                    children: const [
                                      Icon(Icons.calendar_today),
                                      Text("Data de nascimento"),
                                    ],
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  List birth = birthDay.text.split('-');
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: birthDay.text == ''
                                        ? DateTime.now()
                                        : DateTime(
                                            int.parse(birth[2]),
                                            int.parse(birth[1]),
                                            int.parse(birth[0]),
                                          ),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    setState(() {
                                      birthDay.text = formattedDate;
                                    });
                                  } else {}
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              child: DropdownMenu<String>(
                                width: MediaQuery.of(context).size.width * .35,
                                initialSelection: listGender.first,
                                onSelected: (String? value) {
                                  setState(() {
                                    gender.text = value!;
                                  });
                                },
                                dropdownMenuEntries: listGender
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                    value: value,
                                    label: value,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Telefone
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          controller: phone,
                          inputFormatters: [maskFormatter],
                          decoration: const InputDecoration(
                            label: Text('Telefone'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o telefone!';
                            } else if (value.length < 15) {
                              return 'Número inválido';
                            }
                            return null;
                          },
                        ),
                      ),
                      // CPF
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          controller: cpf,
                          inputFormatters: [maskCPF],
                          decoration: const InputDecoration(
                            label: Text('CPF'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o CPF!';
                            } else if (value.length < 14) {
                              return 'CPF inválido';
                            }
                            return null;
                          },
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
                          items: conditions
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
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
                          items: listAllergy
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
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
                          items: listSurgeries
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
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
                          items: listDrugs
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
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
                              child: const Text('Possui plano de saúde?'),
                            ),
                          ],
                        ),
                      ),
                      // Submit
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(10, 175, 158, 1),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Map<String, dynamic> pacient = {
                                "Name": name.text,
                                "Birth day": birthDay.text,
                                "Gender": gender.text,
                                "Phone": phone.text,
                                "Medical Conditions": chronicCondition,
                                "Allergies": allergy,
                                "Surgeries": surgeries,
                                "Drugs": drugs,
                                "CPF": cpf.text,
                                'Health Insurance': isChecked,
                              };
                              post(pacient);
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'SALVA PACIENTE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
