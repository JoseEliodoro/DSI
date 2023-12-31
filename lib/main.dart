import 'package:flutter/material.dart';
import 'package:heal_anality/crudillness/add_illness_page.dart';
import 'package:heal_anality/crudillness/read_illness_page.dart';
import 'package:heal_anality/crudillness/updata_illness_page.dart';
import 'package:heal_anality/crudpacient/read_pacient_page.dart';
import 'package:heal_anality/crudpacient/updata_pacient_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Index/index_page.dart';
import 'auth_check.dart';
import 'crudpacient/add_pacient_page.dart';
import 'historico/historic_page.dart';
import 'home/access_page.dart';
import 'src/themes/color_schemes.g.dart';

import 'firebase_options.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
        scaffoldBackgroundColor: const Color.fromRGBO(10, 175, 158, 1),
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routes: {
        '/': (context) => const IndexPage(),
        './auth': (context) => const AuthCheck(),
        './home': (context) => const HomePage(),
        './historic': (context) => const HistoricPage(),
        './add_pacient': (context) => const AddPacientPage(),
        './read_pacient': (context) => const ReadPacientsPage(),
        './put_pacient': (context) => const UpdataPacientPage(),
        './add_illness': (context) => const AddillnessPage(),
        './read_illness': (context) => const ReadIllnessesPage(),
        './put_illness': (context) => const UpdataIllnessPage(),
      },
    );
  }
}
