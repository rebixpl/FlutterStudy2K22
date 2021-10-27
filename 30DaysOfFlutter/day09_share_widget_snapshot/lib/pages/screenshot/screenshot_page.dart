// Dart
import 'dart:io';

// Packages
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ScreenshotPage extends StatefulWidget {
  const ScreenshotPage({Key? key}) : super(key: key);

  @override
  _ScreenshotPageState createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset('images/kremowa.jpg'),
                      const Text(
                        'Kremówa Papieska',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: _takeScreenshot,
              child: const Text("Take Screenshot and Share!"),
            ),
          ],
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    await _screenshotController.capture().then((image) async {
      if (image != null) {
        final Directory directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareFiles([imagePath.path], text: "2137");
      }
    });
  }
}
