import 'package:flutter/foundation.dart';

import '../models/pokemon.dart';
import '../api/pokemon_api.dart';

class PokemonsState with ChangeNotifier {
  PokemonsState(this._api);

  final PokemonApi _api;

  List<BasePokemon> _pokemons = [];

  get pokemons => _pokemons;

  List<ApiPokemon> _myPokemons = [];
  get myPokemons => _myPokemons;

  // TODO: Create methods to call api

  // TODO: Create catch pokemon logic

}
