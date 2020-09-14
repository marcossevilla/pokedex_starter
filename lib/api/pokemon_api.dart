import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonApi {
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<List<BasePokemon>> getPokemons() async {
    final response = await http.get(apiUrl);
    final decode = json.decode(response.body);

    var pokemons = <BasePokemon>[];

    for (var pokemon in decode['results']) {
      pokemons.add(BasePokemon.fromJson(pokemon));
    }

    return pokemons;
  }

  Future<ApiPokemon> getPokemon(String url) async {
    final response = await http.get(url);
    final decode = json.decode(response.body);
    return ApiPokemon.fromJson(decode);
  }
}
