// Dart
import 'dart:async';

// Packages
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationButton extends StatelessWidget {
  final Function(WebViewController) onPressed;
  final IconData icon;
  final Completer<WebViewController> webViewController;

  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.webViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: webViewController.future,
      builder: (
        BuildContext context,
        AsyncSnapshot<WebViewController> snapshot,
      ) {
        if (snapshot.hasData) {
          return IconButton(
            onPressed: () => onPressed(snapshot.data!),
            icon: Icon(icon),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
