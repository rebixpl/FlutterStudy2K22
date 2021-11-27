import 'package:day15_pokedex_app/bloc/nav_cubit.dart';
import 'package:day15_pokedex_app/error_page.dart';
import 'package:day15_pokedex_app/pokedex_app_bar.dart';
import 'package:day15_pokedex_app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

// Navigator.push(context, SplashPage.route());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pokedexAppBar(),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (previous, next) => previous != next,
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return const SplashPage();
          } else if (state is PokemonPageLoadFailed) {
            return ErrorPage(error: state.error);
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.pokemonListing.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () => BlocProvider.of<NavCubit>(context)
                        .showPokemonDetails(state.pokemonListing[index].id),
                    child: GridTile(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              state.pokemonListing[index].imageUrl,
                              scale: 0.3,
                            ),
                          ),
                          Expanded(
                            child: Text(state.pokemonListing[index].name),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
