import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../models/ability.dart';
import '../models/type.dart' as type;
import '../state/pokemons_state.dart';

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
              context.read<PokemonsState>().catchPokemon(pokemon);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoColumn(title: 'Types', items: pokemon.types),
                SizedBox(width: 10.0),
                _InfoColumn(title: 'Abilities', items: pokemon.abilities),
              ],
            ),
            SizedBox(height: 10.0),
            Wrap(
              children: [
                for (var sprite in pokemon.sprites.props)
                  if (sprite != null) Image.network(sprite),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    Key key,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  final String title;
  final List<Object> items;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline5.copyWith(
          color: Colors.white,
        );

    final textStyle = Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.white,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        SizedBox(height: 10),
        for (var item in items)
          if (item is type.Type)
            Text(
              toBeginningOfSentenceCase(item.type.name),
              style: textStyle,
            ),
        for (var item in items)
          if (item is Ability)
            Text(
              toBeginningOfSentenceCase(item.ability.name),
              style: textStyle,
            ),
      ],
    );
  }
}
