import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/provider/pokedex_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call the method to fetch Pokemon list after the widget has been initialized
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokedexProvider>(context, listen: false).getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Consumer<PokedexProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Pokemon> pokemons = value.pokemonList;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                Pokemon pokemon = pokemons[index];

                return Text(pokemon.name);
              },
            );
          }
        },
      ),
    );
  }
}
