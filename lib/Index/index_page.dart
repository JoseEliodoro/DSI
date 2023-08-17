import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Image.asset(
                'lib/src/images/logo.png',
                //fit: BoxFit.fill,
                width: 204,
                height: 204,
              ),
              const Text(
                'HEAL ANALYTICS',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 82)),
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('./auth'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(14, 134, 119, 1),
                  ),
                  alignment: Alignment.center,
                  height: 57,
                  width: 312,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 26)),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('./auth'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(14, 134, 119, 1),
                  ),
                  alignment: Alignment.center,
                  height: 57,
                  width: 312,
                  child: const Text(
                    'Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
