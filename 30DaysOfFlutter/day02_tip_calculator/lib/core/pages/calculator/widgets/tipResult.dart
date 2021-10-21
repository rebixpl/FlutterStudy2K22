// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TipResult extends StatelessWidget {
  final String tip;

  const TipResult({
    Key? key,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        tip,
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}
