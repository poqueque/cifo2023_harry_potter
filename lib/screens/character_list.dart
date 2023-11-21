import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import '../models/character.dart';

class CharacterList extends StatelessWidget {
  CharacterList({super.key});

  final List<Character> characters = [
    Character(
      name: "Harry Potter",
      url:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1200?cb=20160903184919",
      strength: 6,
      speed: 8,
      magic: 9,
    ),
    Character(
      name: "Hermione Granger",
      url:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/399?cb=20120729103114&path-prefix=es",
      strength: 8,
      speed: 10,
      magic: 10,
    ),
    Character(
      name: "Ron Weasly",
      url:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest?cb=20150523213430",
      strength: 4,
      speed: 6,
      magic: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Welcome to Hogwarts",
        ),
      ),
      body: ListView(
        children: [
          for (Character character in characters)
            Padding(
              padding: const EdgeInsets.all(2),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CharacterDetail(
                                character: character,
                              )));
                },
                leading: Hero(
                  tag: character.name,
                  child: Image.network(character.url),
                ),
                title: Text(character.name),
              ),
            ),
        ],
      ),
    );
  }
}
