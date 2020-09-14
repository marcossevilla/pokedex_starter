import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../state/pokemons_state.dart';

class CatchedScreen extends StatelessWidget {
  static Route go() => MaterialPageRoute<void>(builder: (_) => CatchedScreen());

  @override
  Widget build(BuildContext context) {
    List<ApiPokemon> myPokemons = context.select(
      (PokemonsState state) => state.myPokemons,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Pokemons'),
        elevation: 0.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: myPokemons.length,
        itemBuilder: (context, index) {
          final pokemon = myPokemons[index];

          return ListTile(
            leading: Image.network(pokemon.sprites.frontDefault),
            title: Text(
              toBeginningOfSentenceCase(pokemon.name),
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
