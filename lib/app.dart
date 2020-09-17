import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'api/pokemon_api.dart';
import 'state/pokemons_state.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Setup state management
    return MaterialApp(
      title: 'Pokédex Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
