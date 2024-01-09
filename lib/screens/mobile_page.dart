import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_list.dart';

import 'character_detail.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CharacterList(
      onCharacterSelected: (int id) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterDetail(
                      id: id,
                    )));
      },
    );
  }
}
