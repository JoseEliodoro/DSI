import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/auth_service.dart';
import '../widgets/buttons_menu.dart';
import '../widgets/custom_appbar.dart';
import 'custom_drawer.dart';

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

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          const ButtonsMenu(),
          Expanded(
            child: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onPageStarted: (String url) {
                      print('começou');
                    },
                    onPageFinished: (String url) {
                      print('Terminou');
                    },
                  ),
                )
                ..loadRequest(
                    Uri.parse('https://unname.streamlit.app/?user=${auth.usuario?.uid}')),
            ),
          ),
        ],
      ),
    );
  }
}
