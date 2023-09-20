import 'package:flutter/material.dart';
import 'package:heal_anality/crudpacient/widgets/select.dart';

import '../models/illness.dart';

class PopUpInfo extends StatelessWidget {
  final List<Illness> tabela;
  final int i;
  const PopUpInfo({super.key, required this.tabela, required this.i});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          children: [
            // Nome
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: const [
                  // Descição da doença
                  Text(
                    'Descrição: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              tabela[i].description,
              style: const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
            ),
            // Côdigo da doença
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Côdigo APR DRG: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tabela[i].code.toString(),
                    style:
                        const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
                  ),
                ],
              ),
            ),
            // Risco de mortalidade
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Risco de mortalidade: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].risk,
                      style: const TextStyle(
                          color: Color.fromRGBO(10, 175, 158, 1)),
                    ),
                  ),
                ],
              ),
            ),
            // Severidade da doença
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Severidade da doença: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].servity,
                      style: const TextStyle(
                          color: Color.fromRGBO(10, 175, 158, 1)),
                    ),
                  ),
                ],
              ),
            ),
            // Tipo de procedimento
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Severidade da doença: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].surgical,
                      style: const TextStyle(
                          color: Color.fromRGBO(10, 175, 158, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
