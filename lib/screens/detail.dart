import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, @required this.pokemon}) : super(key: key);

  final ApiPokemon pokemon;

  static Route go(ApiPokemon pokemon) {
    return MaterialPageRoute<void>(
      builder: (_) => DetailScreen(pokemon: pokemon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(toBeginningOfSentenceCase(pokemon.name)),
        actions: [
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Image.network(pokemon.sprites.frontDefault),
        ],
      ),
    );
  }
}
