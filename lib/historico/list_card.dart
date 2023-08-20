import 'package:flutter/material.dart';
import 'package:heal_anality/historico/popup_info.dart';
import 'models/pacient.dart';

class ListCard extends StatelessWidget {
  final List<Pacient> tabela;
  final int i;
  const ListCard({super.key, required this.tabela, required this.i});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Paciente $i'),
          content: PopUpInfo(
            tabela: tabela,
            i: i,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(10, 175, 158, 1),
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth * .3,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(10, 175, 158, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Custo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        tabela[i].cost,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Idade: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tabela[i].getValues()['Age Group'],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromRGBO(10, 175, 158, 1)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Gênero: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tabela[i].gender,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromRGBO(10, 175, 158, 1)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Tipo de admissão: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tabela[i].admission,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromRGBO(10, 175, 158, 1)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Risco de mortalidade: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tabela[i].riskMortality,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color.fromRGBO(10, 175, 158, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
