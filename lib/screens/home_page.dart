import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: GridView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Text(names[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ), 
    );
  }
}