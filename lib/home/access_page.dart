import 'package:flutter/material.dart';
import 'package:heal_anality/home/custom_drawer.dart';
import 'package:heal_anality/widgets/buttons_menu.dart';
import 'package:heal_anality/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    //AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customappbar(),
      body: Column(
        children: [
          const ButtonsMenu(),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double remainingHeight =
                    MediaQuery.of(context).size.height - constraints.maxHeight;
                return Container(
                  height: remainingHeight,
                  width: double.infinity,
                  child: WebViewWidget(controller: controller),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
