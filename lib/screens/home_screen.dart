import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/themes/colour_theme.dart';
import 'package:pokedex/provider/pokedex_provider.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<PokedexProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<Pokemon> pokemons = value.pokemonList;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 80, left: 5, bottom: 20),
                        child: Text(
                          'Pokedex',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.5),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.4,
                            ),
                            itemCount: pokemons.length,
                            itemBuilder: (context, index) {
                              Pokemon pokemon = pokemons[index];
                              return InkWell(
                               onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return DetailsScreen(pokemon: pokemon);
                                      },
                                      opaque: false,
                                    ),
                                  );
                                },
                              child: Container(
                                decoration: BoxDecoration(
                                 color: PokemonColors.getColor(pokemon.type),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 2,
                                      right: 4,
                                      child: Hero(
                                        tag: 'pokemon_image_${pokemon.id}',
                                        child: Image.network(
                                          pokemon.img,
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 50,
                                      left: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              pokemon.name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  shadows: [
                                                    const BoxShadow(
                                                        color: Colors.blueGrey,
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 1.0,
                                                        blurRadius: 15)
                                                  ]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  pokemon.type[0],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      shadows: [
                                                        const BoxShadow(
                                                            color:
                                                                Colors.blueGrey,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 1.0,
                                                            blurRadius: 15)
                                                      ]),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              );
                            },
                          ),
                        ),
                      )
                    ]);
              }
            },
          ),
        ),
      ),
    );
  }
}
