part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess({
    required this.canLoadNextPage,
    required this.pokemonListing,
  });
}

class PokemonPageLoadFailed extends PokemonState {
  final Object error;

  PokemonPageLoadFailed({required this.error});
}
