import 'package:flutter/material.dart';
import 'package:heal_anality/src/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Column(
                  children: [
                    Image.asset(
                      'lib/src/images/logo.png',
                      //fit: BoxFit.fill,
                      width: 144,
                      height: 144,
                    ),
                    const Text(
                      'HEAL ANALYTICS',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 360,
                  height: 585,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HOSPITAL NAME',
                          style: TextStyle(fontSize: 20),
                          ),
                          Text('Sing into your account',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email*',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password*',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(//Sserve pra colocar o 'Esqueceu sua senha?'
                            height: 30,
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                              child: Text('Senha?', textAlign: TextAlign.right,),
                              onPressed:() {
                              Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => HomePage())
                              );
                            },
                            ),
                          ), 
                          SizedBox(height: 90,),
                          ElevatedButton(onPressed: (){
                          }, 
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 23, color: Colors.white),
                            fixedSize: Size(300, 55),
                            backgroundColor: Color.fromRGBO(10, 175, 158, 1),
                            ),
                          ),
                          Container(
                            child: SizedBox(height: 60,)),
                            Text('Dont have an account?'),
                            
                        ],
                      ),
                    ),    
                  ),
                )            
              ]),
            ),
          ],
        ), 
      ),
    );
  }
}