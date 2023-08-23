/* import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BarSearch extends StatefulWidget {
  const BarSearch({super.key});

  @override
  State<BarSearch> createState() => _BarSearchState();
}

class _BarSearchState extends State<BarSearch> {
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

  @override
  Widget build(BuildContext context) {
    var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );

    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * .08,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.white,
          ),
        ),
        //borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: cpf,
                inputFormatters: [maskCPF],
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  labelText: 'CPF',
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
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.bolt),
            ),
            TextButton.icon(
              onPressed: () {
                print('oi');
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
          ],
        ),
      ),
    );
  }
} */
/* 
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
            
 */

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class BarSearch extends StatefulWidget {
  const BarSearch({super.key});

  @override
  State<BarSearch> createState() => _BarSearchState();
}

class _BarSearchState extends State<BarSearch> {
  late Future futuret;
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
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
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
            label: Text('Nome Completo'),
          ),
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
                        DateFormat('dd-MM-yyyy').format(pickedDate);
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
                onSelected: (String? value) {
                  setState(() {
                    gender.text = value!;
                  });
                },
                dropdownMenuEntries:
                    listGender.map<DropdownMenuEntry<String>>((String value) {
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
              child: const Text('Possui plano de saúde?'),
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
          controller: cpf,
          inputFormatters: [maskCPF],
          style: const TextStyle(fontSize: 15),
          decoration: const InputDecoration(
            labelText: 'CPF',
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
          print('oi');
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
