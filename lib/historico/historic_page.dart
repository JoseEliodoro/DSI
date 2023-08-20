import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/custom_drawer.dart';
import '../services/auth_service.dart';
import '../widgets/buttons_menu.dart';
import '../widgets/custom_appbar.dart';
import 'list_card.dart';
import 'models/pacient.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  late Future futuret;

  Future getFilmes(var id) async {
    late List<Predict> tabela = [];
    late List previsoes;
    final response = await http.get(Uri.parse(
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$id/.json'));
    //var response = await http.get(Uri.parse(url));
    previsoes = await json.decode(response.body)['predicts'].values.toList();
    for (int x = 0; x < previsoes.length; x++) {
      tabela.add(Predict.fromJson(previsoes[x]));
    }
    return tabela;
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    void initState() {
      futuret = getFilmes(auth.usuario?.uid);
    }

    initState();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          const ButtonsMenu(),
          FutureBuilder(
            future: futuret,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Predict> tabela = snapshot.data;
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
                                return ListCard(tabela: tabela, i: pacient);
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
                            'Não possui previsões cadastradas',
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


/* 
class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    Predicts previsoes = Predicts(id: auth.usuario?.uid);
    List<Predict> tabela = [];

    void initState() {
      print('oi');
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          const ButtonsMenu(),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double remainingHeight =
                    MediaQuery.of(context).size.height - constraints.maxHeight;
                return Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(237, 237, 237, 1)),
                  height: remainingHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ListView.separated(
                        itemBuilder: (BuildContext context, int pacient) {
                          return ListCard(tabela: tabela, i: pacient);
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
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                tabela = previsoes.tabela;
                print(tabela);
              });
            },
            child: const Text('oi'),
          ),
        ],
      ),
    );
  }
}
*/
/* class _HistoricPageState extends State<HistoricPage> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loade d',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, 
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
 */
