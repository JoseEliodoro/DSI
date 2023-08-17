import 'package:flutter/material.dart';

class ButtonsMenu extends StatelessWidget {
  const ButtonsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 2;
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    String currentRouteName = currentRoute?.settings.name ?? "Unknown Route";

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                if (currentRouteName != './home' ||
                    currentRouteName == './auth') {
                  Navigator.of(context).pushNamed('./home');
                }
              },
              child: Container(
                width: screenWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Previsão',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (currentRouteName != './historic' ||
                    currentRouteName == './auth') {
                  Navigator.of(context).pushNamed('./historic');
                }
              },
              child: Container(
                width: screenWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Histórico',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
