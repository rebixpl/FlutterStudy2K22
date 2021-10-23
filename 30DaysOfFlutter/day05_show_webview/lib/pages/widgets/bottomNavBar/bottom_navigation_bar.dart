// Dart
import 'dart:async';

// Pacakges
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Widgets
import './widgets/navigation_button.dart';
import './widgets/website_loading_percentage.dart';

class BottomNavBar extends StatelessWidget {
  final Function(WebViewController) forwardClicked, backClicked;
  final int progress;
  final Completer<WebViewController> webViewController;

  const BottomNavBar({
    Key? key,
    required this.forwardClicked,
    required this.backClicked,
    required this.progress,
    required this.webViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WebsiteLoadingPercentage(progress: progress),
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            children: [
              NavigationButton(
                onPressed: (controller) => backClicked(controller),
                icon: Icons.chevron_left,
                webViewController: webViewController,
              ),
              NavigationButton(
                onPressed: (controller) => forwardClicked(controller),
                icon: Icons.chevron_right,
                webViewController: webViewController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
