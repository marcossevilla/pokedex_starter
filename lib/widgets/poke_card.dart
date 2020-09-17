// * this will be your customized StatefulWidget

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

import '../screens/detail.dart';
import '../models/pokemon.dart';

class PokeCard extends StatefulWidget {
  const PokeCard({Key key, this.pokeURL}) : super(key: key);

  final String pokeURL;

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  ApiPokemon pokemon;

  _fetchData() async {
    // TODO: new logic to fetch pokemons from state manager and then api
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(DetailScreen.go(pokemon)),
        child: Card(
          child: pokemon == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.network(
                        pokemon.sprites.frontDefault,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(toBeginningOfSentenceCase(pokemon.name)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
