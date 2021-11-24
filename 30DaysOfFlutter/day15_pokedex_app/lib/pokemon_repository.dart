import 'dart:convert';

import 'package:day15_pokedex_app/pokemon_page_response.dart';
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

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return PokemonPageResponse.fromJson(json);
    } else {
      throw Exception("Failed to load pokemon");
    }
  }
}
