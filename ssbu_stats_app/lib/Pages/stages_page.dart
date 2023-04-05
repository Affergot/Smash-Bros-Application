import 'package:flutter/material.dart';
import 'package:ssbu_stats_app/backend/character_data.dart';
import 'package:ssbu_stats_app/backend/data_manager.dart';
import 'package:ssbu_stats_app/tools/character_selector.dart';

class StagePage extends StatefulWidget {
  const StagePage({Key? key}) : super(key: key);

  @override
  State<StagePage> createState() => _StagePage();
}

class _StagePage extends State<StagePage> {
  bool showMatchUpBestStages = false;
  bool showOverallBestStages = false;
  final _characterName = "Mario";
  var _characterData = {};
  //Set states to make sure that only one of the boxes is checked at a time
  showOverallBestStagesOnly() {
    setState(() {
      showOverallBestStages = true;
      showMatchUpBestStages = false;
    });
  }

  showMatchUpBestStagesOnly() {
    setState(() {
      showMatchUpBestStages = true;
      showOverallBestStages = false;
    });
  }

  DataManager dataManager = DataManager();

  void _findCharacterData() {
    final csvReader = CsvReader();
    csvReader.findCharacterStageInfo(_characterName).then((characterData) {
      setState(() {
        _characterData = characterData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stage Selector'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.yellowAccent[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Your Character:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            dataManager.playerCharacter.getIconURL(),
                            width: 65,
                            height: 65,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () async {
                              dynamic selectedCharacter = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CharacterSelect()),
                              );
                              if (selectedCharacter == null) {
                                return;
                              }
                              setState(() {
                                dataManager.playerCharacter =
                                    CharacterData.map(selectedCharacter);
                              });
                            },
                            child:
                                Text(dataManager.playerCharacter.characterName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Opponent's Character:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            dataManager.opponentCharacter.getIconURL(),
                            width: 65,
                            height: 65,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () async {
                              dynamic selectedCharacter = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterSelect()),
                              );
                              setState(() {
                                dataManager.opponentCharacter =
                                    CharacterData.map(selectedCharacter);
                              });
                            },
                            child: Text(
                                dataManager.opponentCharacter.characterName,
                                style: const TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text(
                    "Matchup Options",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: showMatchUpBestStages,
                        onChanged: (value) {
                          showMatchUpBestStagesOnly();
                        },
                      ),
                      Text(
                        "Show Match-up Best Stages",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                      Checkbox(
                        value: showOverallBestStages,
                        onChanged: (value) {
                          showOverallBestStagesOnly();
                        },
                      ),
                      Text(
                        "Show Overall Best Stages",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: _findCharacterData,
                      icon: const Icon(Icons.search),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      label: const Text("Find Stages",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                          ))),
                ),
              ],
            ),
            Expanded(
              child: Card(
                  elevation: 0,
                  color: Colors.grey[200],
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.feed,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 6),
                              const Text("Stage Optimizer",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  )),
                            ],
                          )
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
