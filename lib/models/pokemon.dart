// To parse this JSON data, do
//
//     final simplePokemon = simplePokemonFromJson(jsonString);

import 'dart:convert';

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

  BasePokemon({
    this.name,
    this.url,
  });

  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  int id;
  String name;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  List<Species> forms;
  List<Ability> abilities;

  Pokemon({
    this.id,
    this.name,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.forms,
    this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        forms: List<Species>.from(
          json["forms"].map((x) => Species.fromJson(x)),
        ),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        abilities: List<Ability>.from(
          json["abilities"].map((x) => Ability.fromJson(x)),
        ),
      );
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
