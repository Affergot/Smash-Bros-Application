class MatchupData {
  String matchupKey = "untitled";
  String winningCharacter = "none";
  String losingCharacter = "none";
  String stageName = "untitled";
  int totalWins = 0;
  int totalMatchups = 0;

//Constructor
  MatchupData(this.matchupKey, this.winningCharacter, this.losingCharacter,
      this.stageName, this.totalWins, this.totalMatchups);

  //Constructor from map
//Constructor can be used to create a new object from a Map
  MatchupData.map(Map map) {
    matchupKey = map["matchupKey"];
    matchupKey = map["winningCharacter"];
    matchupKey = map["losingCharacter"];
    matchupKey = map["stageName"];
    matchupKey = map["totalWins"];
    matchupKey = map["totalMatchups"];
  }

//take the matchup object and creates a map that can be used in context
  Map toMap() {
    Map matchupMap = {
      "matchupKey": matchupKey,
      "winningCharacter": winningCharacter,
      "losingCharacter": losingCharacter,
      "stageName": stageName,
      "totalWins": totalWins,
      "totalMatchups": totalMatchups,
    };

    return matchupMap;
  }

//calculate and return win percentage for the matchup
  double getWinPercentage() {
    double winPercentage = (totalWins / totalMatchups as double) * 100.0;
    winPercentage = num.parse(winPercentage.toStringAsFixed(1)).toDouble();

    return winPercentage;
  }

  //Custom formatted information about the character as a String
  @override
  String toString() {
    return "[$winningCharacter vs. $losingCharacter] $stageName | ${getWinPercentage()}% ($totalWins/$totalMatchups)";
  }
}
