class StagesData {
  String thing = "";
  String stageName = "untitled";
  String character = "none";
  int wins = 0;
  int losses = 0;

//Constructor
  StagesData(this.stageName, this.character, this.wins, this.losses);

  //Constructor from map
//Constructor can be used to create a new object from a Map
  StagesData.map(Map map) {
    thing = map["stageName"];
    thing = map["character"];
    thing = map["wins"];
    thing = map["losses"];
  }

//take the matchup object and creates a map that can be used in context
  Map toMap() {
    Map matchupMap = {
      "stageName": stageName,
      "character": character,
      "wins": wins,
      "losses": losses,
    };

    return matchupMap;
  }

//calculate and return win percentage for the matchup
  double getWinPercentage() {
    int total = wins + losses;
    double winPercentage = (wins / total as double) * 100.0;
    winPercentage = num.parse(winPercentage.toStringAsFixed(1)).toDouble();

    return winPercentage;
  }

  //Custom formatted information about the character as a String
  @override
  String toString() {
    return "$character$stageName | ${getWinPercentage()}% ($wins/$losses)";
  }
}
