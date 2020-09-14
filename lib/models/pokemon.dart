// To parse this JSON data, do
//
//     final simplePokemon = simplePokemonFromJson(jsonString);

import 'dart:convert';

import 'stat.dart';
import 'ability.dart';
import 'sprites.dart';
import 'species.dart';
import 'type.dart' as type;

class Pokemons {
  List<BasePokemon> pokemons = [];

  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = BasePokemon.fromJson(item);
      pokemons.add(pokemon);
    });
  }
}

class BasePokemon {
  String name;
  String url;

  // * new property set in the app
  bool catched;

  BasePokemon({this.name, this.url, this.catched = false});

  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(name: json["name"], url: json["url"], catched: false);
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

ApiPokemon pokemonFromJson(String str) => ApiPokemon.fromJson(json.decode(str));

class ApiPokemon {
  int id;
  String name;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<type.Type> types;
  List<Species> forms;
  List<Ability> abilities;

  ApiPokemon({
    this.id,
    this.name,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.forms,
    this.abilities,
  });

  factory ApiPokemon.fromJson(Map<String, dynamic> json) {
    return ApiPokemon(
      id: json["id"],
      name: json["name"],
      stats: List<Stat>.from(json["stats"]?.map((x) => Stat.fromJson(x))),
      types: List<type.Type>.from(
        json["types"]?.map((x) => type.Type.fromJson(x)),
      ),
      forms: List<Species>.from(
        json["forms"]?.map((x) => Species.fromJson(x)),
      ),
      species: Species.fromJson(json["species"]),
      sprites: Sprites.fromJson(json["sprites"]),
      abilities: List<Ability>.from(
        json["abilities"]?.map((x) => Ability.fromJson(x)),
      ),
    );
  }
}
