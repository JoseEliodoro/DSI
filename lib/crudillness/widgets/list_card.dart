import 'package:flutter/material.dart';
import 'package:heal_anality/crudillness/widgets/popup_info.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../models/illness.dart';

class ListCard extends StatefulWidget {
  final List<Illness> tabela;
  final int i;
  final Function(String) del;
  const ListCard(
      {super.key, required this.tabela, required this.i, required this.del});

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
              Text('Doença ${widget.i}'),
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

                auth.illness = widget.tabela[widget.i];
                Navigator.of(context).pushNamed('./put_illness');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Código APR DRG: ${widget.tabela[widget.i].code}",
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      "Risco da doença: ${widget.tabela[widget.i].risk}",
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      'Descrição da Doença:',
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * .8,
                    child: Expanded(
                      child: Text(
                        '${widget.tabela[widget.i].description}',
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                      ),
                    ),
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
