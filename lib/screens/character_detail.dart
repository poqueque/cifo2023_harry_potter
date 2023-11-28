import 'package:flutter/material.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:provider/provider.dart';

import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id});

  final int id;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HogwartsData>(builder: (context, data, child) {
      final character = data.getCharacter(widget.id);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(character.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: character.name,
                child: Image.network(character.url),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.stars),
                  Text("${character.reviews} reviews"),
                ],
              ),
              Text(character.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(
                      value: lastRating.toDouble(),
                      onStarClicked: (value) {
                        lastRating = value;
                        data.addRating(character, value);
                        setState(() {});
                      }),
                  InkWell(
                    onTap: () {
                      data.toggleFavorite(widget.id);
                    },
                    child: Icon(
                      (character.favorite)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.fitness_center),
                      const Text("Força"),
                      Text("${character.strength}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_normal),
                      const Text("Màgia"),
                      Text(character.magic.toString()),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      const Text("Velocitat"),
                      Text(character.speed.toString()),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
