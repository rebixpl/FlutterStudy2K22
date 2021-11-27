import 'package:day15_pokedex_app/app_navigator.dart';
import 'package:day15_pokedex_app/bloc/nav_cubit.dart';
import 'package:day15_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:day15_pokedex_app/bloc/pokemon_details_cubit.dart';
import 'package:day15_pokedex_app/data/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.pokemonRepository}) : super(key: key);

  final PokemonRepository pokemonRepository;

  @override
  Widget build(BuildContext context) {
    final _pokemonDetailsCubit =
        PokemonDetailsCubit(pokemonRepository: pokemonRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kox Pokedex",
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.redAccent,
          primary: Colors.red,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (_) => PokemonBloc(
              pokemonRepository: pokemonRepository,
            )..add(PokemonPageRequest(page: 0)),
          ),
          BlocProvider<NavCubit>(
            create: (_) => NavCubit(pokemonDetailsCubit: _pokemonDetailsCubit),
          ),
          BlocProvider<PokemonDetailsCubit>(
            create: (_) => _pokemonDetailsCubit,
          ),
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
