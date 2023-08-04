import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

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
                              const Text(
                                'Creat account',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 60,
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
                                height: 20,
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Confirm Password*',
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 60,
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
                                child: Text('Register Now'),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              const Text('Already have an account?'),
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
