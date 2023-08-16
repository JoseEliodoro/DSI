import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool visible = true;

  bool isLogin = true;
  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  void setFormAction(bool action) {
    setState(() {
      isLogin = action;
    });
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthExeption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, password.text);
    } on AuthExeption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                    width: 360,
                    height: 600,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
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
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Email*',
                                    labelStyle: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Informe seu Email!';
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(fontSize: 20),
                                ),
                                TextFormField(
                                  controller: password,
                                  obscureText: visible,
                                  decoration: const InputDecoration(
                                    labelText: 'Password*',
                                    labelStyle: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Informe sua senha!';
                                    } else if (value.length < 6) {
                                      return 'Sua senha deve ter no mínimo 6 caracteres';
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
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
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 23, color: Colors.white),
                              fixedSize: const Size(300, 55),
                              backgroundColor:
                                  const Color.fromRGBO(10, 175, 158, 1),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                              child: const SizedBox(
                            height: 60,
                          )),
                          TextButton(
                              onPressed: () => setFormAction(!isLogin),
                              child: const Text('Dont have an account?')),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
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
                        width: 360,
                        height: 600,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          labelText: 'Email*',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Informe seu Email!';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      TextFormField(
                                        controller: password,
                                        obscureText: visible,
                                        decoration: const InputDecoration(
                                          labelText: 'Password*',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Informe sua senha!';
                                          } else if (value.length < 6) {
                                            return 'Sua senha deve ter no mínimo 6 caracteres';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      TextFormField(
                                        controller: confirmPassword,
                                        obscureText: visible,
                                        decoration: const InputDecoration(
                                          labelText: 'Confirm Password*',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Informe sua senha!';
                                          } else if (password.text !=
                                              confirmPassword.text) {
                                            return 'As senhas não coencidem';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      registrar();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 23, color: Colors.white),
                                    fixedSize: const Size(300, 55),
                                    backgroundColor:
                                        const Color.fromRGBO(10, 175, 158, 1),
                                  ),
                                  child: const Text(
                                    'Cadastrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    child: const SizedBox(
                                  height: 60,
                                )),
                                TextButton(
                                    onPressed: () => setFormAction(!isLogin),
                                    child:
                                        const Text('Already have an account?')),
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
}
