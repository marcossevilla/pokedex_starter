import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../screens/catched.dart';
import '../widgets/poke_card.dart';
import '../state/pokemons_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BasePokemon> pokemons = context.select(
      (PokemonsState pokeState) => pokeState.pokemons,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        leading: _PaddedImage(asset: 'assets/images/pikachu.png'),
        title: Text('Pokédex'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(CatchedScreen.go()),
            child: _PaddedImage(asset: 'assets/images/pokeball.png'),
          ),
        ],
      ),
      body: pokemons.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                pokemons.length,
                (index) => PokeCard(pokeURL: pokemons[index].url),
              ),
            ),
    );
  }
}

class _PaddedImage extends StatelessWidget {
  const _PaddedImage({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(asset, width: 50.0, height: 50.0),
    );
  }
}
