import 'package:flutter/material.dart';
import 'package:heal_anality/crudpacient/widgets/popup_info.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../models/pacient.dart';

import 'package:http/http.dart' as http;

/* class ListCard extends StatelessWidget {
  final List<Pacient> tabela;
  final int i;
  const ListCard({super.key, required this.tabela, required this.i});

  Future DELETE(var user, id) async {
    late List<Pacient> tabela = [];
    late List previsoes;
    final response = await http.delete(Uri.parse(
        'https://dsi-mobile-unname-default-rtdb.firebaseio.com/Users/$user/pacients/$id/.json'));
    //var response = await http.get(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    AuthService auth = Provider.of<AuthService>(context);
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Paciente $i'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          content: PopUpInfo(
            tabela: tabela,
            i: i,
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                DELETE(auth.usuario?.uid, tabela[i].id);
              },
              label: const Text(
                'Excluir',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  Color.fromARGB(91, 244, 67, 54),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //Navigator.pop(context, 'OK');
              },
              label: const Text(
                'Editar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  Color.fromARGB(91, 33, 149, 243),
                ),
              ),
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
              Column(
                children: [
                  SizedBox(
                    width: screenWidth * .2,
                    child: Text(
                      'Nome: ${tabela[i].name}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * .2,
                    child: Text(
                      "CPF: ${tabela[i].cpf}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Gênero: ${tabela[i].gender}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Possui plano de saúde? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        tabela[i].healthInsurance ? 'Sim' : 'Não',
                        style: TextStyle(
                          color: tabela[i].healthInsurance
                              ? const Color.fromRGBO(10, 175, 158, 1)
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  
  }
} */
class ListCard extends StatefulWidget {
  final List<Pacient> tabela;
  final int i;
  final Function(String) del;
  const ListCard({super.key, required this.tabela, required this.i, required this.del});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    AuthService auth = Provider.of<AuthService>(context);

    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Paciente ${widget.i}'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          content: PopUpInfo(
            tabela: widget.tabela,
            i: widget.i,
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                widget.del(widget.tabela[widget.i].id);
                Navigator.pop(context, 'OK');
              },
              label: const Text(
                'Excluir',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  Color.fromARGB(91, 244, 67, 54),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //Navigator.pop(context, 'OK');
              },
              label: const Text(
                'Editar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  Color.fromARGB(91, 33, 149, 243),
                ),
              ),
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
              Column(
                children: [
                  SizedBox(
                    width: screenWidth * .2,
                    child: Text(
                      'Nome: ${widget.tabela[widget.i].name}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * .2,
                    child: Text(
                      "CPF: ${widget.tabela[widget.i].cpf}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Gênero: ${widget.tabela[widget.i].gender}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Possui plano de saúde? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        widget.tabela[widget.i].healthInsurance ? 'Sim' : 'Não',
                        style: TextStyle(
                          color: widget.tabela[widget.i].healthInsurance
                              ? const Color.fromRGBO(10, 175, 158, 1)
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
