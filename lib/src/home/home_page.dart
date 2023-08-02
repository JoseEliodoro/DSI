import 'package:flutter/material.dart';
import 'package:heal_anality/src/home/cadastro_page.dart';
import 'package:heal_anality/src/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            SizedBox(height: 48,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginPage(),)
              );
            }, 
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 35, color: Colors.white),
              fixedSize: Size(300, 70),
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CadastroPage(),)
              );
            }, 
            child: Text('Cadastrar'),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 35, color: Colors.white),
              fixedSize: Size(300, 70),
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
