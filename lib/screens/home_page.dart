import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/pokemon_bloc.dart';
import 'package:flutter_pokedex/blocs/pokemon_event.dart';
import 'package:flutter_pokedex/blocs/pokemon_state.dart';
import 'package:flutter_pokedex/models/simple_pokemon.dart';
import 'package:flutter_pokedex/widgets/poke_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PokemonBloc _pokemonBloc;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = PokemonBloc();
    _pokemonBloc.add(GetPokemons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDC0A2D),
        title: Row(
          children: [
            Image.asset(
              'assets/pokeball.png',
              width: 24,
            ),
            const SizedBox(width: 16),
            const Text(
              'Pokédex',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFDC0A2D),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<PokemonBloc, PokemonState>(
            bloc: _pokemonBloc,
            builder: (context, state) {
              if(state is LoadingPokemonState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedPokemonState) {
                final pokemonsList = state.pokemons;
                 return GridView.builder(
                  itemCount: pokemonsList.length,
                  itemBuilder: (context, index) {
                    return PokeCard(
                      pokemon: SimplePokemon(
                        name: pokemonsList[index].name,
                        url: pokemonsList[index].url,
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                );
              } else {
                return const SizedBox.shrink(); //TODO: Add error message
              }
            }
          ),
        ),
      ), 
    );
  }
}