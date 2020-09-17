import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CatchedScreen extends StatelessWidget {
  static Route go() => MaterialPageRoute<void>(builder: (_) => CatchedScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Pokemons'),
        elevation: 0.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      // TODO: Show catched pokemons list
      body: Center(
        child: Text(
          'Here will be the pokemons',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
