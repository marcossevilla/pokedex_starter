import 'package:flutter/material.dart';

import 'screens/home.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex Demo',
      theme: ThemeData(
        fontFamily: 'Pokemon',
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
