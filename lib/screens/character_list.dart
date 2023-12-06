import 'package:flutter/material.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/preferences.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Preferences>(
      builder: (context, preferences, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Welcome to Hogwarts",
            ),
            actions: [
              Switch(
                  value: preferences.showSubtitles,
                  onChanged: (value) {
                    preferences.setShowSubtitles(value);
                  })
            ],
          ),
          body: Consumer<HogwartsData>(
            builder: (context, hogwartsData, child) {
              return ListView(
                children: [
                  for (Character character in hogwartsData.characters)
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterDetail(
                                        id: character.id,
                                      )));
                        },
                        leading: Hero(
                          tag: character.name,
                          child: Image.network(character.url),
                        ),
                        title: Text(character.name),
                        subtitle: (preferences.showSubtitles)
                            ? Text("${character.reviews} reviews")
                            : null,
                        trailing: Icon(
                          (character.favorite)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
