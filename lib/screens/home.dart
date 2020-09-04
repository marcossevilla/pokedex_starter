import 'package:flutter/material.dart';

/*
  * you'll need this:
  static const String url = 'https://pokeapi.co/api/v2/pokemon/';
*/

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              height: 200,
            ),
            Text(
              "Let's catch'em all,\nshall we?",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
