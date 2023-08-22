import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final List el;
  const Select({super.key, required this.el});

  @override
  Widget build(BuildContext context) {
    List<Widget> test = [];
    for (int x = 0; x < el.length; x++) {
      test.add(
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(44, 204, 188, 0.35),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 6,
              bottom: 6,
              left: 16,
              right: 16,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  size: 16,
                ),
                Text(
                  "${el[x]}",
                  style: const TextStyle(
                    color: Color.fromRGBO(44, 204, 188, 0.973),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: test.isEmpty
          ? [
              const Text(
                'Não possui',
                style: TextStyle(
                  color: Color.fromRGBO(44, 204, 188, 0.973),
                ),
              ),
            ]
          : test,
    );
  }
}
/* ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return Container(
            child: Row(
              children: [
                const Icon(Icons.trending_up),
                Text('data'),
              ],
            ),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) {
          return const Divider();
        },
        itemCount: el.length,
      ), */