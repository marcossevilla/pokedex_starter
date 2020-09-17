import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../models/ability.dart';
import '../models/type.dart' as type;

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
          MaterialButton(
            child: Text('Catch'),
            onPressed: () {
              // TODO: Catch pokemon
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      // TODO: Show pokemon detail data on body
    );
  }
}
