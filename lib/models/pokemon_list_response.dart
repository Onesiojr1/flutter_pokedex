import 'package:flutter_pokedex/models/simple_pokemon.dart';

class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<SimplePokemon> results;

  PokemonListResponse.fromJson(Map<String, dynamic> json)
    : count = json['count'],
      next = json['next'],
      previous = json['previous'],
      results = (json['results'] as List).map((e) => SimplePokemon.fromJson(e)).toList();
}