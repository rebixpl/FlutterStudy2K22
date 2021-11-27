import 'package:day15_pokedex_app/bloc/nav_cubit.dart';
import 'package:day15_pokedex_app/pokedex_home_page.dart';
import 'package:day15_pokedex_app/pokedex_pokemon_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          const MaterialPage(child: HomePage()),
          if (pokemonId != null)
            const MaterialPage(
              child: PokemonDetailsPage(),
            ),
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
