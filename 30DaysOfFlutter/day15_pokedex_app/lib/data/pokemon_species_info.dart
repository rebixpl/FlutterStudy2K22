import 'package:day15_pokedex_app/data/pokemon_info_response.dart';

class PokemonSpeciesInfoResponse {
  final String description;

  PokemonSpeciesInfoResponse({required this.description});

  factory PokemonSpeciesInfoResponse.formJson(Map<String, dynamic> json) {
    return PokemonSpeciesInfoResponse(
      description: json['flavor_text_entries'][0]["flavor_text"],
    );
  }
}
