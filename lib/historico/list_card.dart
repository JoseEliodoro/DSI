import 'package:flutter/material.dart';
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
          content: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.9,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
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
                          style: const TextStyle(
                              color: Color.fromRGBO(10, 175, 158, 1)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Gênero: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tabela[i].getValues()['Gender'],
                          style: const TextStyle(
                              color: Color.fromRGBO(10, 175, 158, 1)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Area: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].area,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Condado: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].condado,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Nome do Hospital: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].getValues()['Gender'],
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Raça: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].race,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Etinia: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].ethnicity,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Tempo de Estadia: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].stay.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Tipo de Admissão: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].admission,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Disposição: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].disposition,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Risco de Mortalidade: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].riskMortality,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Gravidade da doença: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i]
                                .getValues()["APR Severity of Illness Code"],
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Fiador: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].patyment,
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Realizou aborto: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].getValues()["Abortion Edit Indicator"],
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Atendimento de emergencia: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i]
                                .getValues()["Emergency Department Indicator"],
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Licensa do provedor de atendimento: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].attending.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Licensa do Provedor Operacional: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].operating.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Código APR DRG: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].aprDrgCode.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Código APR MDC: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            tabela[i].aprMdcCode.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(10, 175, 158, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Custo: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].cost,
                      style: const TextStyle(
                        color: Color.fromRGBO(10, 175, 158, 1),
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
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
