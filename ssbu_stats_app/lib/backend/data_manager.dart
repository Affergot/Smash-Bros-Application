import 'package:ssbu_stats_app/backend/character_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class DataManager {
  static final DataManager _singleton = DataManager._interal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._interal();

  List<CharacterData> characters = [
    CharacterData("Banjo & Kazooie", "Banjo & Kazooie.png"),
    CharacterData("Bayonetta", "Bayonetta.png"),
    CharacterData("Bowser", "Bowser.png"),
    CharacterData("Bowser Jr.", "Bowser Jr.png"),
    CharacterData("Byleth", "Byleth.png"),
    CharacterData("Captain Falcon", "Captain Falcon.png"),
    CharacterData("Corrin", "Corrin.png"),
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
      if (characters[i].characterName.startsWith(_filter)) {
        filteredList.add(characters[i]);
      }
    }

    return filteredList;
  }
}

class CsvReaderGenericResults {
  late final String _filePath;

  CsvReaderGenericResults({String? filePath})
      : _filePath = filePath ?? 'lib/database_files/overall_stage_stats.csv';

  List<String> readLines() {
    final file = File(_filePath);
    return file.readAsLinesSync();
  }

  String findCharacter(String name) {
    final lines = readLines();
    var fullDataMap = {};
    var newMapEntry = {};
    var outputedText = '';
    int count = 0;

    for (final line in lines) {
      final values = line.split(',');

      if (values[2] == name && count < 7) {
        final stageName = values[1];
        final wins = int.parse(values[3]);
        final losses = int.parse(values[4]);
        final winPercentage = (wins / (wins + losses) * 100).toStringAsFixed(2);
        newMapEntry = {
          'winPercentage': winPercentage,
          'wins': wins,
          'losses': losses
        };
        fullDataMap.addAll({stageName: newMapEntry});
        count++;
      }
    }
    //Takes all map data inside fullDataMap and sorts it by win percentage
    fullDataMap = Map.fromEntries(fullDataMap.entries.toList()
      ..sort((e1, e2) =>
          e2.value['winPercentage'].compareTo(e1.value['winPercentage'])));
    //Takes all map data inside fullDataMap and outputs it to a string to be returned
    for (var stage in fullDataMap.keys) {
      outputedText +=
          '\nStage Name: $stage \nWin Percentage: ${fullDataMap[stage]['winPercentage']}% \nWins: ${fullDataMap[stage]['wins']} \nLosses: ${fullDataMap[stage]['losses']} \n';
    }
    return outputedText;
  }
}

class CsvReaderCharacterSpecific {
  late final String _filePath;

  CsvReaderCharacterSpecific({String? filePath})
      : _filePath = filePath ?? 'lib/database_files/matchup_stats.csv';

  List<String> readLines() {
    final file = File(_filePath);
    return file.readAsLinesSync();
  }

  String findCharacter(String player, String opponent) {
    final lines = readLines();
    String text = '';
    int count = 0;

    for (final line in lines) {
      final values = line.split(',');

      if (values[2] == player && values[3] == opponent) {
        final stageName = values[4];
        final wins = int.parse(values[5]);
        final losses = (int.parse(values[6]) - wins);
        final winPercentage = (wins / (wins + losses) * 100).toStringAsFixed(2);
        text +=
            '\nStage Name: $stageName \nWin Percentage: $winPercentage% \nWins: $wins \nLosses: $losses\n ';
        count++;
      }
    }
    return text;
  }
}
