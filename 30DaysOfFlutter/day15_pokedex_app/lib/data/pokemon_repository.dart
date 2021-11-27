import 'dart:convert';

import 'package:day15_pokedex_app/data/pokemon_info_response.dart';
import 'package:day15_pokedex_app/data/pokemon_page_response.dart';
import 'package:day15_pokedex_app/data/pokemon_species_info.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();
  static const int limit = 200;

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400
    // pageIndex starts from 0

    final queryParams = {
      'limit': "$limit",
      'offset': (pageIndex * limit).toString(),
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParams);

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return PokemonPageResponse.fromJson(json);
      } else {
        throw Exception("Failed to load pokemons");
      }
    } catch (e) {
      throw Exception("PokemonRepository:getPokemonPage Error: $e");
    }
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon/$pokemonId");

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return PokemonInfoResponse.fromJson(json);
      } else {
        throw Exception("Failed to get pokemon info");
      }
    } catch (e) {
      throw Exception("PokemonRepository:getPokemonInfo Error: $e");
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon-species/$pokemonId");

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return PokemonSpeciesInfoResponse.formJson(json);
      } else {
        throw Exception("Failed to get pokemon species info");
      }
    } catch (e) {
      throw Exception("PokemonRepository:getPokemonSpeciesInfo Error: $e");
    }
  }
}
