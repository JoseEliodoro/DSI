import 'package:flutter/material.dart';
import 'package:heal_anality/crudpacient/widgets/select.dart';

import '../models/pacient.dart';

class PopUpInfo extends StatelessWidget {
  final List<Pacient> tabela;
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
                children: [
                  const Text(
                    'Nome: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tabela[i].name,
                    style:
                        const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
                  ),
                ],
              ),
            ),
            // Gênero
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
                    tabela[i].gender,
                    style:
                        const TextStyle(color: Color.fromRGBO(10, 175, 158, 1)),
                  ),
                ],
              ),
            ),
            // Data de nascimento
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Data de nascimento: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].birthDay,
                      style: const TextStyle(
                          color: Color.fromRGBO(10, 175, 158, 1)),
                    ),
                  ),
                ],
              ),
            ),
            //Telefone
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Telefone: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tabela[i].phone,
                      style: const TextStyle(
                          color: Color.fromRGBO(10, 175, 158, 1)),
                    ),
                  ),
                ],
              ),
            ),
            // Condições crônicas
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                left: 5,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Condições médicas crônicas:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Select(el: tabela[i].chronicCondition),
            // Alergias
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                left: 5,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Alergias:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Select(el: tabela[i].allergy),
            // Cirurgias
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                left: 5,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Cirurgias realizadas:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Select(el: tabela[i].surgeries),
            // Drogas
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                left: 5,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Uso de drogas:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Select(el: tabela[i].drugs),
            // Plano de saúde
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Row(
                children: [
                  const Text(
                    'Possui plano de saúde? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tabela[i].healthInsurance ? "Sim possui" : "Não possui",
                    style: TextStyle(
                      color: tabela[i].healthInsurance
                          ? const Color.fromRGBO(10, 175, 158, 1)
                          : Colors.red,
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
