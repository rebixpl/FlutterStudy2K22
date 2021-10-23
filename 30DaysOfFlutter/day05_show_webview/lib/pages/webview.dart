// Dart
import 'dart:async';
import 'dart:io';

// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Widgets
import './widgets/bottomNavBar/bottom_navigation_bar.dart';
import './widgets/browser_app_bar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _webviewController = Completer<WebViewController>();
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrowserAppBar(),
      body: WebView(
        initialUrl: "https://www.google.com/",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        onWebViewCreated: (WebViewController controller) =>
            _webviewController.complete(controller),
        onProgress: _updateProgressIndicator,
        gestureNavigationEnabled: true,
        allowsInlineMediaPlayback: true,
      ),
      bottomNavigationBar: BottomNavBar(
        forwardClicked: _goForward,
        backClicked: _goBack,
        progress: _progress,
        webViewController: _webviewController,
      ),
    );
  }

  void _updateProgressIndicator(int progress) {
    setState(() {
      _progress = progress;
      debugPrint("loading website progress $progress");
    });
  }

  void _goBack(WebViewController controller) async {
    final bool canGoBack = await controller.canGoBack();

    if (canGoBack) {
      controller.goBack();
    }
  }

  void _goForward(WebViewController controller) async {
    final bool canGoForward = await controller.canGoForward();

    if (canGoForward) {
      controller.goForward();
    }
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}
