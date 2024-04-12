import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokedex_model.dart';

class PokedexService {
  Future<List<Pokemon>> getAllPokemons() async {
    Uri uriobject = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final response = await http.get(uriobject);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['pokemon'];
      List<Pokemon> pokemons = jsonData.map((json) {
          return Pokemon.fromJson(json);
      }).toList();
      return pokemons;
    }
    else throw Exception("failed to get data");
  }
}