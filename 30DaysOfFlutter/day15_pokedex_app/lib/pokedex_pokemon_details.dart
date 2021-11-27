import 'package:day15_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:day15_pokedex_app/bloc/pokemon_details_cubit.dart';
import 'package:day15_pokedex_app/data/pokemon_details.dart';
import 'package:day15_pokedex_app/pokedex_app_bar.dart';
import 'package:day15_pokedex_app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
      buildWhen: (prev, next) => prev != next,
      builder: (context, details) {
        return details != null
            ? Scaffold(
                appBar: pokedexAppBar(pokemonName: details.name.capitalize()),
                backgroundColor: const Color(0xFFF2F2F2),
                body: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(details.imageUrl),
                            Text(
                              details.name.capitalize(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: details.types
                                  .map((type) => _pokemonTypeView(type))
                                  .toList(),
                            ),
                            Text(
                              'ID: ${details.id}'
                              ' -  Weight: ${details.weight}'
                              ' -  Height: ${details.height}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              details.description,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SplashPage();
      },
    );
  }

  Widget _pokemonTypeView(String type) {
    const Map<String, Color> kTypeColors = {
      'normal': Color(0xFFBDBEB0),
      'poison': Color(0xFF995E98),
      'psychic': Color(0xFFE96EB0),
      'grass': Color(0xFF9CD363),
      'ground': Color(0xFFE3C969),
      'ice': Color(0xFFAFF4FD),
      'fire': Color(0xFFE7614D),
      'rock': Color(0xFFCBBD7C),
      'dragon': Color(0xFF8475F7),
      'water': Color(0xFF6DACF8),
      'bug': Color(0xFFC5D24A),
      'dark': Color(0xFF886958),
      'fighting': Color(0xFF9E5A4A),
      'ghost': Color(0xFF7774CF),
      'steel': Color(0xFFC3C3D9),
      'flying': Color(0xFF81A2F8),
      'electric': Color(0xFFF9E65E),
      'fairy': Color(0xFFEEB0FA),
    };

    Color _getTypeColor(String type) => kTypeColors[type] ?? Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _getTypeColor(type),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          type.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
