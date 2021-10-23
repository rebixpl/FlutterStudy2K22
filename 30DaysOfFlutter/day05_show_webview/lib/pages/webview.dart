// Dart
import 'dart:async';

// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Widgets
import 'widgets/bottomNavBar/bottom_navigation_bar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _webviewController = Completer<WebViewController>();
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kox Webbrowser"),
      ),
      body: WebView(
        initialUrl: "https://google.com/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) =>
            _webviewController.complete(controller),
        onProgress: updateProgressIndicator,
        gestureNavigationEnabled: true,
      ),
      bottomNavigationBar: BottomNavBar(
        forwardClicked: goForward,
        backClicked: goBack,
        progress: _progress,
        webViewControllerFuture: _webviewController.future,
      ),
    );
  }

  void updateProgressIndicator(int progress) {
    setState(() {
      _progress = progress;
      debugPrint("loading website progress $progress");
    });
  }

  void goBack() {}

  void goForward() {}
}
