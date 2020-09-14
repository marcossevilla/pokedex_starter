import 'package:flutter/foundation.dart';
import 'package:pokedex_starter/api/pokemon_api.dart';
import 'package:pokedex_starter/models/pokemon.dart';

class PokemonsState with ChangeNotifier {
  PokemonsState(this._api) {
    getPokemons();
  }

  final PokemonApi _api;

  List<BasePokemon> _pokemons = [];
  get pokemons => _pokemons;

  List<ApiPokemon> _myPokemons = [];
  get myPokemons => _myPokemons;

  getPokemons() async {
    _pokemons = await _api.getPokemons();
    notifyListeners();
  }

  getPokemon(String url) async => await _api.getPokemon(url);

  catchPokemon(ApiPokemon newPokemon) {
    _myPokemons.add(newPokemon);

    final index = _pokemons.indexWhere(
      (pokemon) => pokemon.name == newPokemon.name,
    );

    _pokemons[index].catched = true;

    notifyListeners();
  }
}
