import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/pokemon_event.dart';
import 'package:flutter_pokedex/blocs/pokemon_state.dart';
import 'package:flutter_pokedex/models/simple_pokemon.dart';
import 'package:flutter_pokedex/service/pokemon_service.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonService pokemonService;

  PokemonBloc(this.pokemonService) : super(InitialPokemonState()) {
    on(_mapEventToState);
  }

  _mapEventToState(PokemonEvent event, Emitter emit) async {
    List<SimplePokemon> pokemons = [];

    emit(LoadingPokemonState());

    if (event is GetPokemons) {
      pokemons = await pokemonService.fetchAllPokemons();
    }

    emit(LoadedPokemonState(pokemons: pokemons));
  }
}