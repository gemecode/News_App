import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.url});
  final String url;

  @override
  State<WebView> createState() => _WebViewsState();
}

class _WebViewsState extends State<WebView> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
