import 'dart:convert';

import 'package:flutter_pokedex/models/pokemon_list_response.dart';
import 'package:flutter_pokedex/models/simple_pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  final client = http.Client();
  final baseUrl = 'https://pokeapi.co/api/v2/';

  Future<List<SimplePokemon>> fetchAllPokemons() async {
    final uri = Uri.parse('${baseUrl}pokemon?limit=151');

    final response = await client.get(
      uri, 
    );

    final pokemonResponse = PokemonListResponse.fromJson(json.decode(response.body));
    return pokemonResponse.results;
  }
}