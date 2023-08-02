import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 360,
                  height: 560,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Creat account',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black45
                            ),
                          ),
                          SizedBox(
                            height: 60,
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
                          SizedBox(height: 20,),
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
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password*',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 60,),
                          ElevatedButton(onPressed: (){
                          }, 
                          child: Text('Register Now'),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 23, color: Colors.white),
                            fixedSize: Size(300, 55),
                            backgroundColor: Color.fromRGBO(10, 175, 158, 1),
                            ),
                          ),
                          SizedBox(height: 60,),
                          Text('Already have an account?'),
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