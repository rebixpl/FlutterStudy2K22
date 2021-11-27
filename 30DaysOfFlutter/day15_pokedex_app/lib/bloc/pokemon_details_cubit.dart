import 'package:day15_pokedex_app/data/pokemon_details.dart';
import 'package:day15_pokedex_app/data/pokemon_info_response.dart';
import 'package:day15_pokedex_app/data/pokemon_repository.dart';
import 'package:day15_pokedex_app/data/pokemon_species_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?> {
  PokemonDetailsCubit({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository,
        super(null);

  final PokemonRepository _pokemonRepository;

  void getPokemonDetails(int pokemonId) async {
    // if task1 takes 5 sec and task2 takes 2 sec, then Future.wait will start them simultaneously,
    // so overall time would be 5 sec
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: speciesInfo.description,
    ));
  }

  void clearPokemonDetails() => emit(null);
}
