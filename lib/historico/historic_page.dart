import 'package:flutter/material.dart';
import 'package:heal_anality/home/custom_drawer.dart';
import 'package:heal_anality/widgets/buttons_menu.dart';
import '../widgets/custom_appbar.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
                  height: remainingHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ListView.separated(
                        padding: const EdgeInsets.fromLTRB(30, 65, 30, 200),
                        itemCount: 100,
                        itemBuilder: (_, index) {
                          return const SizedBox(
                            height: 140,
                            width: 30,
                            child: Text('oi'),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(height: 10);
                        },
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
