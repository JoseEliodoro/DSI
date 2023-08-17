import 'package:flutter/material.dart';
import 'package:heal_anality/home/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (String url) {
        print('começou');
      },
    ))
    ..loadRequest(Uri.parse('https://unname.streamlit.app/'));

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    //print(auth.);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Predict Values'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
