import 'package:flutter/material.dart';

class TipAmount extends StatelessWidget {
  final double tip;
  const TipAmount({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      tip != 0 ? (tip.toStringAsFixed(2) + " PLN") : "",
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
