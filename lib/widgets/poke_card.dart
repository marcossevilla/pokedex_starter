// * this will be your customized StatefulWidget

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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
    final response = await http.get(widget.pokeURL);
    final decode = json.decode(response.body);
    final data = ApiPokemon.fromJson(decode);
    setState(() => pokemon = data);
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
                        child: Image.network(pokemon.sprites.frontDefault)),
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
