import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDC0A2D)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
