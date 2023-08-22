import 'package:flutter/material.dart';
import 'package:heal_anality/crudpacient/models/pacient.dart';
import 'package:provider/provider.dart';

import '../home/custom_drawer.dart';
import '../services/auth_service.dart';
import '../widgets/custom_appbar.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'widgets/list_card.dart';

class ReadPacientsPage extends StatefulWidget {
  const ReadPacientsPage({super.key});

  @override
  State<ReadPacientsPage> createState() => _ReadPacientsPageState();
}

class _ReadPacientsPageState extends State<ReadPacientsPage> {
  late Future futuret;

  Future getPredicts(var id) async {
    late List<Pacient> tabela = [];
    late List previsoes;
    final response = await http.get(Uri.parse(
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$id/pacients/.json'));
    //var response = await http.get(Uri.parse(url));
    previsoes = await json.decode(response.body).values.toList();

    for (int x = 0; x < previsoes.length; x++) {
      Map<String, dynamic> pacient = previsoes[x];
      pacient["Id"] = json.decode(response.body).keys.toList()[x];
      tabela.add(Pacient.fromJson(pacient));
    }
    return tabela;
  }

  late int code = 0;
  DELETE(var user, String id) async {
    final response = await http.delete(Uri.parse(
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$user/pacients/$id/.json'));
    if (response.statusCode == 200) {
      code = 200;
      return null;
    }
    code = 400;
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    void initState() {
      futuret = getPredicts(auth.usuario?.uid);
    }

    initState();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.amber),
          ),
          FutureBuilder(
            future: futuret,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Pacient> tabela = snapshot.data;
                return Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double remainingHeight =
                          MediaQuery.of(context).size.height -
                              constraints.maxHeight;
                      return Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(237, 237, 237, 1)),
                        height: remainingHeight,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ListView.separated(
                              itemBuilder: (BuildContext context, int pacient) {
                                return ListCard(
                                  tabela: tabela,
                                  i: pacient,
                                  del: (String id) async {
                                    print(id);
                                    await DELETE(auth.usuario?.uid, id);
                                    if (code == 200) {
                                      setState(() {
                                        tabela.removeAt(pacient);
                                      });
                                    } else {
                                      Exception('Erro');
                                    }
                                  },
                                );
                              },
                              padding: const EdgeInsets.all(16),
                              separatorBuilder: (_, __) {
                                return const Divider();
                              },
                              itemCount: tabela.length,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double remainingHeight =
                          MediaQuery.of(context).size.height -
                              constraints.maxHeight;
                      return Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(237, 237, 237, 1)),
                        height: remainingHeight,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Não possui pacientes cadastrados',
                            style: TextStyle(
                              color: Color.fromARGB(255, 194, 192, 192),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double remainingHeight =
                        MediaQuery.of(context).size.height -
                            constraints.maxHeight;
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(237, 237, 237, 1)),
                      height: remainingHeight,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(10, 175, 158, 1),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
