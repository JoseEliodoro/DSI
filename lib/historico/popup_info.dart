import 'package:flutter/material.dart';

import 'models/pacient.dart';

class PopUpInfo extends StatelessWidget {
  final List<Predict> tabela;
  final int i;
  const PopUpInfo({super.key, required this.tabela, required this.i});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
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
                    style:
                        const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
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
                    style:
                        const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
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
                      tabela[i].nomeHospital,
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
                      tabela[i].getValues()["APR Severity of Illness Code"],
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
                      tabela[i].getValues()["Emergency Department Indicator"],
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
    );
  }
}
