import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../providers/preferences.dart';

class CharacterList extends StatefulWidget {
  const CharacterList(
      {super.key, this.showAppBar = true, required this.onCharacterSelected});

  final bool showAppBar;
  final Function(int) onCharacterSelected;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Preferences>(
      builder: (context, preferences, child) {
        return Scaffold(
          appBar: widget.showAppBar
              ? AppBar(
                  backgroundColor: Colors.purple,
                  title: Text(
                    AppLocalizations.of(context)!.welcomeToHogwarts,
                  ),
                  actions: [
                    Switch(
                        value: preferences.showSubtitles,
                        onChanged: (value) {
                          preferences.setShowSubtitles(value);
                        })
                  ],
                )
              : null,
          body: Consumer<HogwartsData>(
            builder: (context, hogwartsData, child) {
              return ListView(
                children: [
                  for (Character character in hogwartsData.characters)
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                        onTap: () {
                          widget.onCharacterSelected(character.id);
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
