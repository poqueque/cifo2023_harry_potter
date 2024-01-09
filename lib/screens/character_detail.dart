import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id, this.showAppBar = true});

  final int? id;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    return Consumer<HogwartsData>(builder: (context, data, child) {
      Character? character;
      if (widget.id != null) {
        character = data.getCharacter(widget.id!);
      }

      if (character == null) {
        return const Scaffold(
          body: Center(
            child: Text("Please select a character"),
          ),
        );
      } else {
        return Scaffold(
          appBar: widget.showAppBar
              ? AppBar(
                  backgroundColor: Colors.purple,
                  title: Text(character.name),
                  centerTitle: true,
                )
              : null,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: character.name,
                    child: Image.network(character.url),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.stars),
                  Flexible(
                    child: Text(
                      l.nReviews(character.reviews),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                        data.addRating(character!, value);
                        setState(() {});
                      }),
                  InkWell(
                    onTap: () {
                      data.toggleFavorite(widget.id!);
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
                      Text(l.strength),
                      Text("${character.strength}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_normal),
                      Text(l.magic),
                      Text(character.magic.toString()),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      Text(l.speed),
                      Text(character.speed.toString()),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }
    });
  }
}
