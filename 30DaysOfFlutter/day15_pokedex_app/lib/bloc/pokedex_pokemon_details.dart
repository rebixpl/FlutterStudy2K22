import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const PokemonDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
