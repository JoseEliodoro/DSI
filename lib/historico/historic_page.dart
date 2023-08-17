import 'package:flutter/material.dart';
import 'package:heal_anality/home/custom_drawer.dart';
import 'package:heal_anality/widgets/buttons_menu.dart';
import '../widgets/custom_appbar.dart';
import 'list_card.dart';
import 'models/pacient.dart';
import 'models/pacient_repository.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
  final List<Pacient> tabela = MoedaRepository.tabela;
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
        ],
      ),
    );
  }
}
