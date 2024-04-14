import 'package:flutter/material.dart';

class PokemonColors {
  static Color getColor(List<String> types) {
    Color tileColour = Colors.white;
    if (types[0] == 'Grass') {
      tileColour = Colors.greenAccent;
    }
    if (types[0] == 'Fire') {
      tileColour = Colors.redAccent;
    }
    if (types[0] == 'Water') {
      tileColour = Colors.blue;
    }
    if (types[0] == 'Bug') {
      tileColour = Colors.lightGreenAccent;
    }
    if (types[0] == 'Normal') {
      tileColour = Colors.pink;
    }
    if (types[0] == 'Poison') {
      tileColour = Colors.deepPurpleAccent;
    }
    if (types[0] == 'Electric') {
      tileColour = Colors.amber;
    }
    if (types[0] == 'Ground') {
      tileColour = Colors.brown;
    }
    if (types[0] == 'Fairy') {
      tileColour = Colors.pink;
    }
    if (types[0] == 'Fighting') {
      tileColour = Colors.orange;
    }
    if (types[0] == 'Psychic') {
      tileColour = Colors.indigo;
    }
    if (types[0] == 'Rock') {
      tileColour = Colors.grey;
    }
    if (types[0] == 'Ghost') {
      tileColour = Colors.deepPurple;
    }
    if (types[0] == 'Ice') {
      tileColour = Colors.cyan;
    }
    if (types[0] == 'Dragon') {
      tileColour = Colors.indigo;
    }
    if (types[0] == 'Dark') {
      tileColour = Colors.black;
    }
    if (types[0] == 'Steel') {
      tileColour = Colors.grey;
    }
    return tileColour;
  }
}
