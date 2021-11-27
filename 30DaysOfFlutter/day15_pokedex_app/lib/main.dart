import 'package:day15_pokedex_app/pokedex_view.dart';
import 'package:day15_pokedex_app/data/pokemon_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    pokemonRepository: PokemonRepository(),
  ));
}
