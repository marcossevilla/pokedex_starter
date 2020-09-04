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

  BasePokemon({this.name, this.url});

  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(name: json["name"], url: json["url"]);
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

ApiPokemon pokemonFromJson(String str) => ApiPokemon.fromJson(json.decode(str));

class ApiPokemon {
  int id;
  String name;
  Sprites sprites;

  ApiPokemon({
    this.id,
    this.name,
    this.sprites,
  });

  factory ApiPokemon.fromJson(Map<String, dynamic> json) {
    return ApiPokemon(
      id: json["id"],
      name: json["name"],
      sprites: Sprites.fromJson(json["sprites"]),
    );
  }
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
