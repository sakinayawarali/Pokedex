import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokedex_provider.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/screens/home_screen.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokedexProvider>(
      create: (context) => PokedexProvider(),
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
