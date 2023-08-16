import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heal_anality/access/access_page.dart';


class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});
  
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
    drawer: Drawer(
      child: Column( children: [
        UserAccountsDrawerHeader(
          accountName: Text('Usuario'), 
          accountEmail: Text('Usuario123@gmail.com')),
        ListTile(
          leading: Icon(Icons.attach_email_sharp),
          title: Text('Menu'),
        ),
        Text('Opcao 1'),
        Text('Opcao 2'),
      ],),
    ),
    appBar: AppBar(
      toolbarHeight: 100,
      backgroundColor: Color.fromRGBO(10, 175, 158, 1),
      title: Row(children: [
        SizedBox(width: 150,),
        Text('Heal Analytics')
      ],),
    ),
     body: Column(
        children: [
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(10, 175, 158, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccessPage()));
                  },
                  child: Center(child: Text('Previsao', style: TextStyle(color: Colors.white, fontSize: 20)),),
                ),
                SizedBox(width: 100),
                Text('Historico', style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          )
        ],
    ),
      )
    );
  }
}


