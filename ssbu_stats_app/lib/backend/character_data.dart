class CharacterData {
  String characterName = "missing"; //The name of the character
  String characterIcon = "None.png"; //Endpoint of the character's icon URL

  //Constructor
  CharacterData(String _characterName, String _characterIcon) {
    //Initialize the variables
    characterName = _characterName;
    characterIcon = _characterIcon;
  }
//Constructor from map
//Constructor can be used to create a new object from a Map
  CharacterData.map(Map _map) {
    characterName = _map["characterName"];
    characterIcon = _map["characterIcon"];
  }

  String getIconURL() {
    return "assets/character_icons/${characterIcon}";
  }

  Map toMap() {
    Map CharacterMap = {
      "characterName": characterName,
      "characterIcon": characterIcon,
    };

    return CharacterMap;
  }

//Custom formatted information about the character as a String
  @override
  String toString() {
    return "Character Name: ${characterName} | Character Icon: assets/character_icons/${characterIcon}";
  }
}
