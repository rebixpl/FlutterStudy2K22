import 'package:bloc/bloc.dart';
import 'package:day15_pokedex_app/data/pokemon_page_response.dart';
import 'package:day15_pokedex_app/data/pokemon_repository.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository,
        super(PokemonInitial()) {
    on<PokemonPageRequest>(_onPokemonPageRequest);
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _onPokemonPageRequest(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadInProgress());

    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonPageLoadSuccess(
        canLoadNextPage: pokemonPageResponse.canLoadNextPage,
        pokemonListing: pokemonPageResponse.pokemonListings,
      ));
    } catch (e) {
      emit(PokemonPageLoadFailed(error: e));
    }
  }
}
