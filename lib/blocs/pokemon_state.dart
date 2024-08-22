import 'package:flutter_pokedex/models/simple_pokemon.dart';

abstract class PokemonState {
  final List<SimplePokemon> pokemons;

  PokemonState({required this.pokemons});
}

class InitialPokemonState extends PokemonState {
  InitialPokemonState() : super(pokemons: []);
}

class LoadingPokemonState extends PokemonState {
  LoadingPokemonState() : super(pokemons: []);
}

class LoadedPokemonState extends PokemonState {
  LoadedPokemonState({required super.pokemons});
}

class ErrorPokemonState extends PokemonState {
  final Exception exception;
  
  ErrorPokemonState({
    required this.exception
  }) : super(pokemons: []);
}