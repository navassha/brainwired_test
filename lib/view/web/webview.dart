import 'package:brain_wired_mechine_test/Widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.uri, required this.name});
  final String uri;
  final String name;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse("https://github.com/navassha"));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.back)),
        backgroundColor: Colors.black,
        title: StyledText(text: name, size: 25),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
