import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                              const Text(
                                'HOSPITAL NAME',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                'Sing into your account',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Email*',
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password*',
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),
                              Container(
                                //Sserve pra colocar o 'Esqueceu sua senha?'
                                height: 30,
                                alignment: Alignment.centerRight,
                                child: FloatingActionButton(
                                  child: const Text(
                                    'Senha?',
                                    textAlign: TextAlign.right,
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pushNamed('/'),
                                ),
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 23, color: Colors.white),
                                  fixedSize: const Size(300, 55),
                                  backgroundColor:
                                      const Color.fromRGBO(10, 175, 158, 1),
                                ),
                                child: const Text('Login'),
                              ),
                              Container(
                                  child: const SizedBox(
                                height: 60,
                              )),
                              const Text('Dont have an account?'),
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
