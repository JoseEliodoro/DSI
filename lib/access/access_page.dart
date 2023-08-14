import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
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
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
