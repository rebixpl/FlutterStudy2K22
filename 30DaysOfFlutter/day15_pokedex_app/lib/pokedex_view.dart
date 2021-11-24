import 'package:day15_pokedex_app/bloc/pokedex_pokemon_details.dart';
import 'package:day15_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:day15_pokedex_app/pokedex_app_bar.dart';
import 'package:day15_pokedex_app/pokedex_home_page.dart';
import 'package:day15_pokedex_app/pokemon_repository.dart';
import 'package:day15_pokedex_app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.pokemonRepository}) : super(key: key);

  final PokemonRepository pokemonRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (_) => PokemonBloc(
            pokemonRepository: pokemonRepository,
          )..add(PokemonPageRequest(page: 0)),
        ),
      ],
      child: const PokedexView(),
    );
  }
}

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.redAccent,
          primary: Colors.red,
        ),
      ),
      builder: (context, child) {
        return BlocListener<PokemonBloc, PokemonState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is PokemonPageLoadSuccess) {
              _navigator.pushAndRemoveUntil<void>(
                HomePage.route(),
                (route) => false,
              );
            } else if (state is PokemonPageLoadFailed) {
              Center(
                child: Text("Loading Pokemon Failed: ${state.error}"),
              );
            } else if (state is PokemonLoadInProgress) {
              const SplashPage();
            } else {
              Container();
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
