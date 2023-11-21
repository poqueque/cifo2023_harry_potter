import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: widget.character.name,
              child: Image.network(widget.character.url),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Rating(value: widget.character.stars),
                Text("${widget.character.reviews} reviews"),
              ],
            ),
            Text(widget.character.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Rating(
                value: lastRating.toDouble(),
                onStarClicked: (value) {
                  lastRating = value;
                  widget.character.addRating(value);
                  setState(() {});
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.fitness_center),
                    const Text("Força"),
                    Text("${widget.character.strength}"),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.auto_fix_normal),
                    const Text("Màgia"),
                    Text(widget.character.magic.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.speed),
                    const Text("Velocitat"),
                    Text(widget.character.speed.toString()),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
