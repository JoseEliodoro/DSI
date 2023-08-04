import 'package:flutter/material.dart';

import 'src/themes/color_schemes.g.dart';
import 'src/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
        scaffoldBackgroundColor: const Color.fromRGBO(10, 175, 158, 1),
        
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routes: {
        //title: 'Heal Analytics'
        //'/': (context) => const Home(),
      },
      home: HomePage(),
    );
  }
}
