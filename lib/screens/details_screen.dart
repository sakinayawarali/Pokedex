// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:pokedex/themes/font_theme.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/themes/colour_theme.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PokemonColors.getColor(pokemon.type),
      appBar: AppBar(
        backgroundColor: PokemonColors.getColor(pokemon.type),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      '#${pokemon.num}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 5, bottom: 5),
                  child: Text(
                    pokemon.type[0],
                    style: const TextStyle(color: Colors.white, shadows: [
                      const BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 0),
                          spreadRadius: 1.0,
                          blurRadius: 15)
                    ]),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.black.withOpacity(0.3)),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.3,
                    child: Container(
                      height: height * 0.8,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Column(
                                      crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Name',
                                         style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Height', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Weight', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Spawn Time', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Weakness', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Pre Evolution', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                        Text('Next Evolution', style: detailsScreen.detailsLabel(),
                                        ),
          SizedBox(height: 10,),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                      height: 0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(pokemon.name, style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(pokemon.height.toString(), style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(pokemon.weight.toString(), style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(pokemon.spawnTime.toString(), style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(pokemon.weaknesses.join(', '), style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(
                                          pokemon.prevEvolution?.isNotEmpty ??
                                                  false
                                              ? pokemon.prevEvolution
                                                      ?.join(', ') ??
                                                  'Just Hatched'
                                              : 'Just Hatched',
                                          style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        Text(
                                          pokemon.nextEvolution!
                                              .map((evolution) =>
                                                  evolution['name'])
                                              .join(', '), style: detailsScreen.details(),),
                                        SizedBox(height: 10,),
                                        
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.1,
                    left: width * 0.25,
                    right: width * 0.25,
                    child: Hero(
                      tag: 'pokemon_image_${pokemon.id}',
                      child: Image.network(
                        pokemon.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
