import 'package:day15_pokedex_app/bloc/pokedex_pokemon_details.dart';
import 'package:day15_pokedex_app/pokedex_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pokedexAppBar,
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: state.pokemonListing.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () => _navigator.push<void>(
                PokemonDetails.route(),
              ),
              child: GridTile(
                child: Column(
                  children: [
                    Image.network(state.pokemonListing[index].imageUrl),
                    Text(state.pokemonListing[index].name),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
