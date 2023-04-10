import 'package:ssbu_stats_app/backend/character_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:ssbu_stats_app/backend/matchup_data.dart';
import 'package:ssbu_stats_app/backend/stages_data.dart';

class DataManager {
  static final DataManager _singleton = DataManager._interal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._interal();

  List<MatchupData> matchups = [];
  List<MatchupData> topMatchups = [];
  List<StagesData> stages = [];
  List<StagesData> topStages = [];

  List<CharacterData> characters = [
    CharacterData("Banjo & Kazooie", "Banjo & Kazooie.png"),
    CharacterData("Bayonetta", "Bayonetta.png"),
    CharacterData("Bowser", "Bowser.png"),
    CharacterData("Bowser Jr.", "Bowser Jr.png"),
    CharacterData("Byleth", "Byleth.png"),
    CharacterData("Captain Falcon", "Captain Falcon.png"),
    CharacterData("Corrin", "Corrin.png"),
    CharacterData("Chrom", "Chrom.png"),
    CharacterData("Cloud", "Cloud.png"),
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

  void getTopMatchups() {
    filterMatchupsByCharacters(playerCharacter, opponentCharacter);
    sortMatchupsByWinPercentage();
  }

  void getTopStages() {
    filterStagesByCharacter(playerCharacter);
    sortStagesByWinPercentage();
  }

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

  void filterStagesByCharacter(CharacterData playerCharacter) {
    topStages.clear();
    for (StagesData stageEntry in stages) {
      if (stageEntry.character == playerCharacter.characterName) {
        topStages.add(stageEntry);
      }
    }
  }

//Filter top matchups to only include the given characters
  void filterMatchupsByCharacters(
      CharacterData character1, CharacterData character2) {
    topMatchups.clear();
    for (MatchupData matchupEntry in matchups) {
      if (matchupEntry.winningCharacter.toLowerCase() ==
              (character1.characterName.toLowerCase()) &&
          matchupEntry.losingCharacter.toLowerCase() ==
              (character2.characterName.toLowerCase())) {
        topMatchups.add(matchupEntry);
      }
    }
  }

//Sort the top matchups by winning percentage in descending order
  void sortMatchupsByWinPercentage() {
    List<MatchupData> sortedMatchups = [];
    bool hasMovedEntry = true;

    MatchupData? cachedMatchupData;

    sortedMatchups.clear();
    for (MatchupData matchupData in topMatchups) {
      sortedMatchups.add(matchupData);
    }

    while (hasMovedEntry) {
      hasMovedEntry = false;

      for (int i = sortedMatchups.length - 1; i > 0; i--) {
        if (sortedMatchups[i].getWinPercentage() >
            sortedMatchups[i - 1].getWinPercentage()) {
          cachedMatchupData = sortedMatchups[i - 1];
          sortedMatchups[i - 1] = sortedMatchups[i];
          sortedMatchups[i] = cachedMatchupData;
          hasMovedEntry = true;
        }
      }
    }

    topMatchups = sortedMatchups;
  }

  void sortStagesByWinPercentage() {
    List<StagesData> sortedStages = [];
    bool hasMovedEntry = true;

    StagesData? cachedStagesData;

    sortedStages.clear();
    for (StagesData stagesData in topStages) {
      sortedStages.add(stagesData);
    }

    while (hasMovedEntry) {
      hasMovedEntry = false;

      for (int i = sortedStages.length - 1; i > 0; i--) {
        if (sortedStages[i].getWinPercentage() >
            sortedStages[i - 1].getWinPercentage()) {
          cachedStagesData = sortedStages[i - 1];
          sortedStages[i - 1] = sortedStages[i];
          sortedStages[i] = cachedStagesData;
          hasMovedEntry = true;
        }
      }
    }

    topStages = sortedStages;
  }
}

class CsvReader {
  late final String _filePath;
  late final List<String> _dataLines;

  CsvReader({String? filePath})
      : _filePath =
            (filePath) ?? ('lib/database_files/overall_stage_stats.csv');

  Future<String> loadAsset() async {
    return await rootBundle.loadString(_filePath);
  }

  Future<void> readLines() async {
    String? assetData = await loadAsset();

    _dataLines = assetData.split('\n');
  }

  Future<Map<String, dynamic>> findCharacterStageInfo(String name) async {
    await readLines();

    for (final line in _dataLines) {
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

  void getStageData() async {
    DataManager dataManager = DataManager();

    dataManager.stages.clear();

    await readLines();

    for (final line in _dataLines) {
      final values = line.split(',');

      try {
        StagesData stageData = (StagesData(
            values[1], values[2], int.parse(values[3]), int.parse(values[4])));
        dataManager.stages.add(stageData);
      } catch (error) {
        print(error);
      }
    }
  }

  void getMatchupData() async {
    DataManager dataManager = DataManager();

    dataManager.matchups.clear();

    await readLines();

    for (final line in _dataLines) {
      final values = line.split(',');

      try {
        MatchupData matchupData = (MatchupData(values[1], values[2], values[3],
            values[4], int.parse(values[5]), int.parse(values[6])));
        dataManager.matchups.add(matchupData);
      } catch (error) {
        print(error);
      }
    }
  }
}
