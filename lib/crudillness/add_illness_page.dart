import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/custom_drawer.dart';
import '../services/auth_service.dart';
import '../widgets/custom_appbar.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class AddillnessPage extends StatefulWidget {
  const AddillnessPage({super.key});

  @override
  State<AddillnessPage> createState() => _AddillnessPageState();
}

class _AddillnessPageState extends State<AddillnessPage> {
  late Future futuret;
  final formKey = GlobalKey<FormState>();

  final description = TextEditingController();
  final risk = TextEditingController();
  final servity = TextEditingController();
  final code = TextEditingController();

  final surgical = TextEditingController();

  bool isChecked = false;
  
  @override
  void initState() {
    risk.text = 'Baixo';
    servity.text = 'Baixo';
    surgical.text = 'Cirúrgico';
    super.initState();
  }

  POST(String user, Map illness) async {
    String link =
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$user/illness/.json';
    await http.post(
      Uri.parse(link),
      body: json.encode(illness),
    );
  }



  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    List<String> listRisks = ['Baixo', 'Moderado', 'Alto', 'Extremo'];
    List<String> listSurgicas = ['Cirúrgico', 'Médico', 'Outro'];
    bool isPost = false;

    post(illness) async {
      setState(() {
        isPost = true;
      });
      await POST('${auth.usuario?.uid}', illness);
      setState(() {
        isPost = false;
        description.text = '';
        servity.text = '';
        risk.text = '';
        surgical.text = '';
        code.text = '';
      });
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar('Add Illness'),
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
                      // Descrição da doença
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          controller: description,
                          decoration: const InputDecoration(
                            label: Text('Descrição da doença'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe a descrição da doença!';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Código da doença
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: TextFormField(
                          controller: code,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            label: Text('Código da doença'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o Código da doença!';
                            }
                            return null;
                          },
                        ),
                      ),
                      // Risco de mortalidade
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                'Risco de morte:',
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width * .94,
                              initialSelection: listRisks.first,
                              onSelected: (String? value) {
                                setState(() {
                                  risk.text = value!;
                                });
                              },
                              dropdownMenuEntries: listRisks
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      // Severidade da doença
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                'Severidade da doença:',
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width * .94,
                              initialSelection: listRisks.first,
                              onSelected: (String? value) {
                                setState(() {
                                  servity.text = value!;
                                });
                              },
                              dropdownMenuEntries: listRisks
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      // Tipo de procedimento
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                'Tipo de procedimento:',
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DropdownMenu<String>(
                              width: MediaQuery.of(context).size.width * .94,
                              initialSelection: listSurgicas.first,
                              onSelected: (String? value) {
                                setState(() {
                                  surgical.text = value!;
                                });
                              },
                              dropdownMenuEntries: listSurgicas
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
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
                              Map<String, dynamic> illness = {
                                "Description": description.text,
                                "Servity": servity.text,
                                "Risk": risk.text,
                                "Surgical": surgical.text,
                                "Code": code.text,
                              };
                              post(illness);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: isPost
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'SALVA DOENÇA',
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
