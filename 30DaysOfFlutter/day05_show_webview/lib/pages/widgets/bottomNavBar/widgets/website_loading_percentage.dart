// Packages
import 'package:flutter/material.dart';

class WebsiteLoadingPercentage extends StatelessWidget {
  final int progress;
  const WebsiteLoadingPercentage({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        (progress == 0) || (progress == 100) ? "" : "$progress%",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
