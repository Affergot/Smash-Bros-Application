import 'package:ssbu_stats_app/backend/character_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

import 'package:ssbu_stats_app/backend/matchup_data.dart';

class DataManager {
  static final DataManager _singleton = DataManager._interal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._interal();

  List<MatchupData> matchups = [
    // MatchupData(
    //     "Bowser Fox Battlefield", "Bowser", "Fox", "Battlefield", 137, 225),
    // MatchupData("Captain Falcon Ike Pokemon Stadium 2", "Captain Falcon", "Ike",
    //     "Pokemon Stadium 2", 252, 586),
    // MatchupData("Ganondorf Link Final Destination", "Ganondorf", "Link",
    //     "Final Destination", 149, 290),
    // MatchupData("Lucina Pikachu Town and City", "Lucina", "Pikachu",
    //     "Town and City", 192, 466)
  ];

  List<CharacterData> characters = [
    CharacterData("Banjo & Kazooie", "Banjo & Kazooie.png"),
    CharacterData("Bayonetta", "Bayonetta.png"),
    CharacterData("Bowser", "Bowser.png"),
    CharacterData("Bowser Jr.", "Bowser Jr.png"),
    CharacterData("Byleth", "Byleth.png"),
    CharacterData("Captain Falcon", "Captain Falcon.png"),
    CharacterData("Chorrin", "Chorrin.png"),
    CharacterData("Chrom", "Chrom.png"),
    CharacterData("Daisy", "Daisy.png"),
    CharacterData("Dark Pit", "Dark Pit.png"),
    CharacterData("Dark Samus", "Dark Samus.png"),
    CharacterData("Diddy Kong", "Diddy Kong.png"),
    CharacterData("Donkey Kong", "Donkey Kong.png"),
    CharacterData("Dr. Mario", "Dr Mario.png"),
    CharacterData("Duck Hunt", "Duck Hunt.png"),
    CharacterData("Falco", "Falco.png"),
    CharacterData("Fox", "Fox.png"),
    CharacterData("Ganondorf", "Ganondorf.png"),
    CharacterData("Greninja", "Greninja.png"),
    CharacterData("Hero", "Hero.png"),
    CharacterData("Ice Climbers", "Ice Climbers.png"),
    CharacterData("Ike", "Ike.png"),
    CharacterData("Incineroar", "Incineroar.png"),
    CharacterData("Inkling", "Inkling.png"),
    CharacterData("Isabelle", "Isabelle.png"),
    CharacterData("Jigglypuff", "Jigglypuff.png"),
    CharacterData("Joker", "Joker.png"),
    CharacterData("Kazuya", "Kazuya.png"),
    CharacterData("Ken", "Ken.png"),
    CharacterData("King Dedede", "King Dedede.png"),
    CharacterData("King K. Rool", "King K. Rool.png"),
    CharacterData("Kirby", "Kirby.png"),
    CharacterData("Link", "Link.png"),
    CharacterData("Little Mac", "Little Mac.png"),
    CharacterData("Lucario", "Lucario.png"),
    CharacterData("Lucas", "Lucas.png"),
    CharacterData("Lucina", "Lucina.png"),
    CharacterData("Luigi", "Luigi.png"),
    CharacterData("Mario", "Mario.png"),
    CharacterData("Marth", "Marth.png"),
    CharacterData("Mega Man", "Mega Man.png"),
    CharacterData("Meta Knight", "Meta Knight.png"),
    CharacterData("Mewtwo", "Mewtwo.png"),
    CharacterData("Mii Brawler", "Mii Brawler.png"),
    CharacterData("Mii Gunner", "Mii Gunner.png"),
    CharacterData("Mii Swordfighter", "Mii Swordfighter.png"),
    CharacterData("Min Min", "Min Min.png"),
    CharacterData("Mr. Game & Watch", "Mr Game & Watch.png"),
    CharacterData("Ness", "Ness.png"),
    CharacterData("Olimar", "Olimar.png"),
    CharacterData("Pac-Man", "Pac-Man.png"),
    CharacterData("Palutena", "Palutena.png"),
    CharacterData("Peach", "Peach.png"),
    CharacterData("Pichu", "Pichu.png"),
    CharacterData("Pickachu", "Pickachu.png"),
    CharacterData("Piranha Plant", "Piranha Plant.png"),
    CharacterData("Pit", "Pit.png"),
    CharacterData("Pokemon Trainer", "Pokemon Trainer.png"),
    CharacterData("Pyra & Mythra", "Pyra & Mythra.png"),
    CharacterData("ROB", "ROB.png"),
    CharacterData("Richter", "Richter.png"),
    CharacterData("Ridley", "Ridley.png"),
    CharacterData("Robin", "Robin.png"),
    CharacterData("Rosalina & Luma", "Rosalina & Luma.png"),
    CharacterData("Roy", "Roy.png"),
    CharacterData("Ryu", "Ryu.png"),
    CharacterData("Samus", "Samus.png"),
    CharacterData("Sephiroth", "Sephiroth.png"),
    CharacterData("Sheik", "Sheik.png"),
    CharacterData("Shulk", "Shulk.png"),
    CharacterData("Simon", "Simon.png"),
    CharacterData("Snake", "Snake.png"),
    CharacterData("Sonic", "Sonic.png"),
    CharacterData("Steve", "Steve.png"),
    CharacterData("Terry", "Terry.png"),
    CharacterData("Toon Link", "Toon Link.png"),
    CharacterData("Villager", "Villager.png"),
    CharacterData("Wario", "Wario.png"),
    CharacterData("Wii Fit Trainer", "Wii Fit Trainer.png"),
    CharacterData("Wolf", "Wolf.png"),
    CharacterData("Yoshi", "Yoshi.png"),
    CharacterData("Young Link", "Young Link.png"),
    CharacterData("Zelda", "Zelda.png"),
    CharacterData("Zero Suit Samus", "Zero Suit Samus.png"),
  ];

  CharacterData playerCharacter = CharacterData("Select Character", "None.png");
  CharacterData opponentCharacter =
      CharacterData("Select Character", "None.png");

//create a list of characters based on the _filter String
  List<CharacterData> getFilteredCharacterList(String _filter) {
    List<CharacterData> filteredList = [];

    for (int i = 0; i < characters.length; i++) {
      if (characters[i]
          .characterName
          .toLowerCase()
          .startsWith(_filter.toLowerCase())) {
        filteredList.add(characters[i]);
      }
    }

    return filteredList;
  }
}

class CsvReader {
  late final String _filePath;

  CsvReader({String? filePath})
      : _filePath = filePath ?? 'lib/database_files/overall_stage_stats.csv';

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/database_files/matchup_stats.csv');
  }

  Future<List<String>> readLines() async {
    String? assetData = await loadAsset();

    final values = assetData.split('\n');
    return values;
  }

  Future<Map<String, dynamic>> findCharacterStageInfo(String name) async {
    final lines = await readLines();

    for (final line in lines) {
      final values = line.split(',');

      if (values[2] == name) {
        final stageName = values[1];
        final wins = int.parse(values[3]);
        final losses = int.parse(values[4]);
        return {
          'stageName': stageName,
          'wins': wins,
          'losses': losses,
        };
      }
    }

    return {};
  }

  void getMatchupData() async {
    DataManager dataManager = DataManager();

    dataManager.matchups.clear();

    final lines = await readLines();

    for (final line in lines) {
      final values = line.split(',');

      try {
        MatchupData matchupData = (MatchupData(values[1], values[2], values[3],
            values[4], int.parse(values[5]), int.parse(values[6])));
        dataManager.matchups.add(matchupData);
      } catch (error) {
        print(error);
      }
    }
    print(dataManager.matchups[18]);
  }
}
