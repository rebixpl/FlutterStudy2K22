import 'package:flutter/material.dart';

AppBar pokedexAppBar({String pokemonName = ""}) {
  return AppBar(
    title: pokemonName == ""
        ? const Text("Pokedex")
        : Text("$pokemonName Details"),
    centerTitle: true,
  );
}
