import 'package:ssbu_stats_app/backend/character_data.dart';

class DataManager {
  static final DataManager _singleton = DataManager._interal();

  factory DataManager() {
    return _singleton;
  }

  DataManager._interal();

  List<CharacterData> characters = [
    CharacterData("Link", "Link.png"),
    CharacterData("Ganondorf", "Ganondorf.png"),
    CharacterData("Lucina", "Lucina.png"),
    CharacterData("Snake", "Snake.png"),
    CharacterData("Diddy Kong", "Diddy Kong.png"),
    CharacterData("Mario", "Mario.png"),
    CharacterData("Fox", "Fox.png"),
    CharacterData("Jigglypuff", "Jigglypuff.png"),
    CharacterData("Steve", "Steve.png"),
    CharacterData("Sephiroth", "Sephiroth.png"),
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
