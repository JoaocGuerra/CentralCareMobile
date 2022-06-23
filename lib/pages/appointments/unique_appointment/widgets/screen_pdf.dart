import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PagePDF extends StatelessWidget {
  final String url;

  const PagePDF({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(10), // here the desired height
          child: AppBar(
            backgroundColor: Colors.black,
          )),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
