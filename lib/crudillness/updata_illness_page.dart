import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../home/custom_drawer.dart';
import '../services/auth_service.dart';
import '../widgets/custom_appbar.dart';

import 'package:http/http.dart' as http;

class UpdataIllnessPage extends StatefulWidget {
  const UpdataIllnessPage({super.key});

  @override
  State<UpdataIllnessPage> createState() => _UpdataIllnessPageState();
}

class _UpdataIllnessPageState extends State<UpdataIllnessPage> {
  late Future futuret;
  final formKey = GlobalKey<FormState>();
  final description = TextEditingController();
  final risk = TextEditingController();
  final servity = TextEditingController();
  final code = TextEditingController();

  final surgical = TextEditingController();
  bool isChecked = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  PUT(String user, String id, Map paciente) async {
    String link =
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$user/illness/$id/.json';
    await http.put(
      Uri.parse(link),
      body: json.encode(paciente),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    put(pacient) async {
      await PUT('${auth.usuario?.uid}', "${auth.illness?.id}", pacient);
      Navigator.of(context).pushNamed('./read_illness');
    }

    if (auth.illness == null) {
      return Scaffold(
        drawer: const CustomDrawer(),
        appBar: customappbar('Update Illness'),
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    initState() {
      if (isLoading) {
        description.text = '${auth.illness?.description}';
        code.text = '${auth.illness?.code}';
        risk.text = '${auth.illness?.risk}';
        servity.text = '${auth.illness?.servity}';
        surgical.text = '${auth.illness?.surgical}';

        isLoading = !isLoading;
      }
    }

    List<String> listRisks = ['Baixo', 'Moderado', 'Alto', 'Extremo'];
    List<String> listSurgicas = ['Cirúrgico', 'Médico', 'Outro'];

    initState();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar('Update Illness'),
      body: Column(
        children: [
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
                              initialSelection: risk.text,
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
                              initialSelection: servity.text,
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
                              initialSelection: surgical.text,
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
                              Map<String, dynamic> pacient = {
                                "Description": description.text,
                                "Servity": servity.text,
                                "Risk": risk.text,
                                "Surgical": surgical.text,
                                "Code": code.text,
                              };
                              put(pacient);
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'EDITE DOENÇA',
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
