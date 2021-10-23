// Pacakges
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Widgets
import './widgets/navigation_button.dart';

class BottomNavBar extends StatelessWidget {
  final Function() forwardClicked, backClicked;
  final int progress;
  final Future<WebViewController> webViewControllerFuture;

  const BottomNavBar({
    Key? key,
    required this.forwardClicked,
    required this.backClicked,
    required this.progress,
    required this.webViewControllerFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (progress == 0) || (progress == 100) ? "" : "$progress%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            ButtonBar(
              children: [
                NavigationButton(
                  onPressed: () {},
                  icon: Icons.chevron_left,
                  webViewControllerFuture: webViewControllerFuture,
                ),
                IconButton(
                  onPressed: forwardClicked,
                  icon: const Icon(Icons.chevron_right),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
