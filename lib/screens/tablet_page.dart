import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import 'character_list.dart';

class TabletPage extends StatefulWidget {
  const TabletPage({super.key});

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  int? selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Welcome to Hogwarts"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: CharacterList(
              showAppBar: false,
              onCharacterSelected: (id) {
                selectedCharacter = id;
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: CharacterDetail(
              id: selectedCharacter,
              showAppBar: false,
            ),
          ),
        ],
      ),
    );
  }
}
