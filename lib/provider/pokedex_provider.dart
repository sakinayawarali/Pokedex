import 'package:flutter/material.dart';
import 'package:pokedex/service/pokedex_service.dart';
import 'package:pokedex/models/pokedex_model.dart';

class PokedexProvider extends ChangeNotifier {
  final _service = PokedexService();
  bool isLoading = false;
  List<Pokemon> _pokemon = [];

  List<Pokemon> get pokemonList => _pokemon;

  Future<void> getAllPokemon() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllPokemons();

    _pokemon = response;

    isLoading = false;
    notifyListeners();
  }
}
