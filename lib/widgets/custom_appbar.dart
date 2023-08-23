import 'package:flutter/material.dart';

AppBar customappbar(String title) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: const Color.fromRGBO(10, 175, 158, 1),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white, // Change Custom Drawer Icon Color
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: const Color.fromRGBO(10, 175, 158, 1),
      title: Row(
        children: const [
          SizedBox(
            width: 150,
          ),
          Text(
            'Heal Analytics',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
