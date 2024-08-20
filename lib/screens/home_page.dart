import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/simple_pokemon.dart';
import 'package:flutter_pokedex/widgets/poke_card.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final List<String> names = [
    'Teste1',
    'Teste2',
    'Teste3',
    'Teste4',
    'Teste5',
  ];

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
          child: GridView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return PokeCard(
                pokemon: SimplePokemon(
                  name: 'Bulbasaur',
                  url: 'https://pokeapi.co/api/v2/pokemon/1/'
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ), 
    );
  }
}